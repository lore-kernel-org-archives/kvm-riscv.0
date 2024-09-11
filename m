From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 11 Sep 2024 10:39:03 +1000
Subject: [kvm-unit-tests PATCH 1/2] configure: Introduce add-config
In-Reply-To: <20240903143946.834864-5-andrew.jones@linux.dev>
References: <20240903143946.834864-4-andrew.jones@linux.dev>
 <20240903143946.834864-5-andrew.jones@linux.dev>
Message-ID: <D431AYECDJV3.1AVQCTIRV2J4G@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed Sep 4, 2024 at 12:39 AM AEST, Andrew Jones wrote:
> Allow users to add additional CONFIG_* and override defaults
> by concatenating a given file with #define's and #undef's to
> lib/config.h

That's a horrible config format lol, but probbaly the simplest way to
get something working. What if you included the user config first, then
make the generated config test ifndef before defining the default?

Is it better to have a config file than to just add more --options to
configure? If we had thousands of options maybe, but so far we are
getting by with configure options. I think I prefer that for now
unless we wholesale moved everything to a .config style.

Thanks,
Nick

>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  configure | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/configure b/configure
> index 27ae9cc89657..7a1317d0650d 100755
> --- a/configure
> +++ b/configure
> @@ -64,6 +64,8 @@ usage() {
>  	                           no environ is provided by the user (enabled by default)
>  	    --erratatxt=FILE       specify a file to use instead of errata.txt. Use
>  	                           '--erratatxt=' to ensure no file is used.
> +	    --add-config=FILE      specify a file containing configs (CONFIG_*) to add on to the
> +	                           generated lib/config.h. Use #undef to override default configs.
>  	    --host-key-document=HOST_KEY_DOCUMENT
>  	                           Specify the machine-specific host-key document for creating
>  	                           a PVM image with 'genprotimg' (s390x only)
> @@ -153,6 +155,10 @@ while [[ "$1" = -* ]]; do
>  	    erratatxt=
>  	    [ "$arg" ] && erratatxt=$(eval realpath "$arg")
>  	    ;;
> +	--add-config)
> +	    add_config=
> +	    [ "$arg" ] && add_config=$(eval realpath "$arg")
> +	    ;;
>  	--host-key-document)
>  	    host_key_document="$arg"
>  	    ;;
> @@ -213,6 +219,10 @@ if [ "$erratatxt" ] && [ ! -f "$erratatxt" ]; then
>      echo "erratatxt: $erratatxt does not exist or is not a regular file"
>      exit 1
>  fi
> +if [ "$add_config" ] && [ ! -f "$add_config" ]; then
> +    echo "add-config: $add_config does not exist or is not a regular file"
> +    exit 1
> +fi
>  
>  arch_name=$arch
>  [ "$arch" = "aarch64" ] && arch="arm64"
> @@ -502,4 +512,8 @@ cat <<EOF >> lib/config.h
>  
>  EOF
>  fi
> +if [ "$add_config" ]; then
> +    echo "/* Additional configs from $add_config */" >> lib/config.h
> +    cat "$add_config" >> lib/config.h
> +fi
>  echo "#endif" >> lib/config.h


