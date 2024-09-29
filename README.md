# Jekyll GitHub Pages Docker Setup

This repository contains a Dockerfile and configuration for setting up a Jekyll environment that's compatible with GitHub Pages. It allows you to develop your site locally using Docker and easily deploy it to GitHub Pages.

## Prerequisites

- Docker installed on your machine
- Git installed on your machine
- A GitHub account and a repository for your GitHub Pages site

## Getting Started

1. Clone this repository or copy the Dockerfile and Gemfile into your Jekyll project directory.

2. Build the Docker image:
   ```
   ./docker-jekyll build
   ```

2. (Only required when setting up a new site) - Initialize the jekyll site in a subdirectory at `/site/jekyll`
    ```
    docker run -v $(pwd):/site --user $(id -u):$(id -g)  jentic-github-pages jekyll new jekyll
    ```

3. Run the container:
   ```
   ./docker-jekyll serve
   ```

4. Access your site at `http://localhost:4000`

## Development Workflow

1. Make changes to your Jekyll site files on your local machine.

2. The running Docker container will automatically detect changes and rebuild your site.

3. Refresh your browser to see the changes.

## Deploying to GitHub Pages

1. Ensure your repository is set up for GitHub Pages:
   - Go to your repository settings on GitHub
   - In the "Pages" section, set the source to the branch you want to deploy from (usually `main` or `gh-pages`)

2. Build your site:
   ```
   docker run -v $(pwd):/site jentic-github-pages jekyll build
   ```

3. The built site will be in the `_site` directory.

4. Commit and push the changes to your GitHub repository:
   ```
   git add .
   git commit -m "Update site"
   git push origin main
   ```

   Replace `main` with your deployment branch if different.

5. GitHub will automatically deploy your site. You can check the status in the "Actions" tab of your repository.

## Customization

- To add plugins or change Jekyll settings, modify the `Gemfile` and `_config.yml` files.
- To change the Docker setup, modify the `Dockerfile`.

## Troubleshooting

- If you encounter permission issues, you may need to run Docker commands with `sudo` (on Linux) or run them as an administrator (on Windows).
- Ensure your `_config.yml` file is set up correctly for GitHub Pages. You may need to set `baseurl` and `url` appropriately.

## Additional Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Docker Documentation](https://docs.docker.com/)

For more detailed information or troubleshooting, refer to the official documentation linked above.