From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 12 Jun 2024 09:16:36 +0200
Subject: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
In-Reply-To: <20240612044234.212156-1-npiggin@gmail.com>
References: <20240612044234.212156-1-npiggin@gmail.com>
Message-ID: <20240612-39939298ecbc2ba78479a2f2@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 12, 2024 at 02:42:32PM GMT, Nicholas Piggin wrote:
> arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
> in dependency chains that cause them to be made as intermediate files,
> which get removed when make finishes. This results in unnecessary
> partial rebuilds. If make is run again, this time the .aux.o targets
> are not intermediate, possibly due to being made via different
> dependencies.
> 
> Adding .aux.o files to .PRECIOUS prevents them being removed and solves
> the rebuild problem.
> 
> s390x does not have the problem because .SECONDARY prevents dependancies
> from being built as intermediate. However the same change is made for
> s390x, for consistency.
> 
> Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/Makefile.common     | 2 +-
>  powerpc/Makefile.common | 2 +-
>  riscv/Makefile          | 2 +-
>  s390x/Makefile          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>

