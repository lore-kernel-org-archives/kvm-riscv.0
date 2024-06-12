From: Marc Hartmayer <mhartmay@linux.ibm.com>
Date: Wed, 12 Jun 2024 08:48:07 +0200
Subject: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
In-Reply-To: <20240612044234.212156-1-npiggin@gmail.com>
References: <20240612044234.212156-1-npiggin@gmail.com>
Message-ID: <87a5jqejx4.fsf@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 12, 2024 at 02:42 PM +1000, Nicholas Piggin <npiggin@gmail.com> wrote:
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

[?snip?]

> @@ -85,7 +85,7 @@ CFLAGS += -fno-delete-null-pointer-checks
>  LDFLAGS += -Wl,--build-id=none
>  
>  # We want to keep intermediate files
> -.PRECIOUS: %.o %.lds
> +.PRECIOUS: %.o %.aux.o %.lds
>  
>  asm-offsets = lib/$(ARCH)/asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
> -- 
> 2.45.1
>
>

Thanks for fixing this!

Reviewed-by: Marc Hartmayer <mhartmay@linux.ibm.com>

-- 
Kind regards / Beste Gr??e
   Marc Hartmayer

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Wolfgang Wendt
Gesch?ftsf?hrung: David Faller
Sitz der Gesellschaft: B?blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

