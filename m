From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 18:57:14 +0100
Subject: [kvm-unit-tests PATCH v4 4/8] migration: Support multiple
 migrations
In-Reply-To: <20240209091134.600228-5-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-5-npiggin@gmail.com>
Message-ID: <54232155-ef97-4911-b1c7-acc7ee06a676@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 10.11, Nicholas Piggin wrote:
> Support multiple migrations by flipping dest file/socket variables to
> source after the migration is complete, ready to start again. A new
> destination is created if the test outputs the migrate line again.
> Test cases may now switch to calling migrate() one or more times.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/migrate.c         |  8 ++--
>   lib/migrate.h         |  1 +
>   scripts/arch-run.bash | 86 ++++++++++++++++++++++++++++++++++++-------
>   3 files changed, 77 insertions(+), 18 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



