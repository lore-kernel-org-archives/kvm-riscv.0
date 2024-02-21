From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 21 Feb 2024 08:43:10 +0100
Subject: [kvm-unit-tests PATCH v5 7/8] Add common/ directory for
 architecture-independent tests
In-Reply-To: <20240221032757.454524-8-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
 <20240221032757.454524-8-npiggin@gmail.com>
Message-ID: <20240221-5417524c1ca5d615f005c7d6@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 21, 2024 at 01:27:56PM +1000, Nicholas Piggin wrote:
> x86/sieve.c is used by s390x, arm, and riscv via symbolic link. Make a
> new directory common/ for architecture-independent tests and move
> sieve.c here.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/sieve.c    |  2 +-
>  common/sieve.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sieve.c  |  2 +-
>  s390x/sieve.c  |  2 +-
>  x86/sieve.c    | 52 +-------------------------------------------------
>  5 files changed, 55 insertions(+), 54 deletions(-)
>  create mode 100644 common/sieve.c
>  mode change 100644 => 120000 x86/sieve.c
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>

