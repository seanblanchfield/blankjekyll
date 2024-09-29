# Use a Ruby base image
FROM ruby:3.1

# Install essential Linux packages
RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    nodejs \
    npm \
    git

# Set the working directory in the container
WORKDIR /site

# Copy the Gemfile into the container
COPY Gemfile ./

# Create an empty Gemfile.lock
RUN touch Gemfile.lock

# Install Bundler
RUN gem install bundler

# Install dependencies
RUN bundle install

# Remove conflicting sass-embedded gem if it exists
# RUN gem uninstall sass-embedded --force || true

# Install GitHub Pages gem
# RUN gem install github-pages

# Copy the rest of your site into the container
COPY . .

# Expose port 4000 for the Jekyll server
EXPOSE 4000

# Set the default command to serve the site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]