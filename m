From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 25 Nov 2024 13:52:03 +0100
Subject: [kvm-unit-tests PATCH v3 1/4] riscv: Add "-deps" handling for
 tests
In-Reply-To: <20241125115452.1255745-2-cleger@rivosinc.com>
References: <20241125115452.1255745-1-cleger@rivosinc.com>
 <20241125115452.1255745-2-cleger@rivosinc.com>
Message-ID: <20241125-cdb4055c9d58e66f04fc5db5@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 12:54:45PM +0100, Cl?ment L?ger wrote:
> Some tests uses additional files that needs to be linked in the final
> binary. This is the case for asm-sbi.S which is only used by the sbi
> test. Add a "-deps" per test variable that allows to designate
> additional .o files.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

