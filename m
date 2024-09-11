From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 10:24:00 +0200
Subject: [kvm-unit-tests PATCH v2 3/4] configure: Support cross compiling
 with clang
In-Reply-To: <D430ZV4FP2GE.3B7VE2I37RPXX@gmail.com>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-9-andrew.jones@linux.dev>
 <D430ZV4FP2GE.3B7VE2I37RPXX@gmail.com>
Message-ID: <20240911-99a010a84e453f4362566c6b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 10:24:34AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> > When a user specifies the compiler with --cc assume it's already
> > fully named, even if the user also specifies a cross-prefix. This
> > allows clang to be selected for the compiler, which doesn't use
> > prefixes, but also still provide a cross prefix for binutils. If
> > a user needs a prefix on the compiler that they specify with --cc,
> > then they'll just have to specify it with the prefix prepended.
> 
> Makes sense.
> 
> > Also ensure user provided cflags are used when testing the compiler,
> > since the flags may drastically change behavior, such as the --target
> > flag for clang.
> 
> Could be a separate patch but no big deal.
> 
> >
> > With these changes it's possible to cross compile for riscv with
> > clang after configuring with
> >
> >  ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
> >              --cross-prefix=riscv64-linux-gnu-
> 
> Nice. Perhaps add a recipe to README?

Sure.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
drew

