From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 13:08:17 +0100
Subject: [kvm-unit-tests PATCH 29/32] configure: Fail on unknown arch
In-Reply-To: <20240226101218.1472843-30-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-30-npiggin@gmail.com>
Message-ID: <20240228-d598a1eb6a25935f54aeaa01@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 26, 2024 at 08:12:15PM +1000, Nicholas Piggin wrote:
> configure will accept an unknown arch, and if it is the name of a
> directory in the source tree the command will silently succeed. Make
> it only accept supported arch names.
> 
> Also print the full path of a missing test directory to disambiguate
> the error in out of tree builds.
> 
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Cc: Andrew Jones <andrew.jones@linux.dev>
> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Janosch Frank <frankja@linux.ibm.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Nico B?hr <nrb@linux.ibm.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: kvm at vger.kernel.org
> Cc: linux-s390 at vger.kernel.org
> Cc: kvmarm at lists.linux.dev
> Cc: kvm-riscv at lists.infradead.org
> Cc: linuxppc-dev at lists.ozlabs.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  configure | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 6907ccbbb..ae522c556 100755
> --- a/configure
> +++ b/configure
> @@ -45,7 +45,8 @@ usage() {
>  	Usage: $0 [options]
>  
>  	Options include:
> -	    --arch=ARCH            architecture to compile for ($arch)
> +	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> +	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>  	    --processor=PROCESSOR  processor to compile for ($arch)
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
> @@ -321,11 +322,15 @@ elif [ "$arch" = "ppc64" ]; then
>  elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      testdir=riscv
>      arch_libdir=riscv
> +elif [ "$arch" = "s390x" ]; then
> +    testdir=s390x
>  else
> -    testdir=$arch
> +    echo "arch $arch is not supported!"
> +    arch=
> +    usage
>  fi
>  if [ ! -d "$srcdir/$testdir" ]; then
> -    echo "$testdir does not exist!"
> +    echo "$srcdir/$testdir does not exist!"
>      exit 1
>  fi
>  
> -- 
> 2.42.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

