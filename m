From: Thomas Huth <thuth@redhat.com>
Date: Wed, 4 Sep 2024 08:10:23 +0200
Subject: [kvm-unit-tests PATCH 2/3] configure: Support cross compiling
 with clang
In-Reply-To: <20240903163046.869262-7-andrew.jones@linux.dev>
References: <20240903163046.869262-5-andrew.jones@linux.dev>
 <20240903163046.869262-7-andrew.jones@linux.dev>
Message-ID: <f8c797ae-a8de-4e6f-a1b5-c0db79e15011@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 03/09/2024 18.30, Andrew Jones wrote:
> When a user specifies the compiler with --cc assume it's already
> fully named, even if the user also specifies a cross-prefix. This
> allows clang to be selected for the compiler, which doesn't use
> prefixes, but also still provide a cross prefix for binutils. If
> a user needs a prefix on the compiler that they specify with --cc,
> then they'll just have to specify it with the prefix prepended.
> 
> Also ensure user provided cflags are used when testing the compiler,
> since the flags may drastically change behavior, such as the --target
> flag for clang.
> 
> With these changes it's possible to cross compile for riscv with
> clang after configuring with
> 
>   ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
>               --cross-prefix=riscv64-linux-gnu-
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   configure | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


