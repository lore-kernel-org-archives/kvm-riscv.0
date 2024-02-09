From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 09:29:05 +0100
Subject: [kvm-unit-tests PATCH v3 7/8] Add common/ directory for
 architecture-independent tests
In-Reply-To: <20240209070141.421569-8-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-8-npiggin@gmail.com>
Message-ID: <92633259-1a46-4342-a709-7200c6d215ab@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 08.01, Nicholas Piggin wrote:
> x86/sieve.c is used by s390x, arm, and riscv via symbolic link. Make a
> new directory common/ for architecture-independent tests and move
> sieve.c here.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arm/sieve.c    |  2 +-
>   common/sieve.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
>   riscv/sieve.c  |  2 +-
>   s390x/sieve.c  |  2 +-
>   x86/sieve.c    | 52 +-------------------------------------------------
>   5 files changed, 55 insertions(+), 54 deletions(-)
>   create mode 100644 common/sieve.c
>   mode change 100644 => 120000 x86/sieve.c


Reviewed-by: Thomas Huth <thuth@redhat.com>


