From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 19:09:03 +0100
Subject: [kvm-unit-tests PATCH v4 6/8] migration: Add quiet migration
 support
In-Reply-To: <20240209091134.600228-7-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-7-npiggin@gmail.com>
Message-ID: <62518aea-1214-4d33-8a15-41f1a494ee0b@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 10.11, Nicholas Piggin wrote:
> Console output required to support migration becomes quite noisy
> when doing lots of migrations. Provide a migrate_quiet() call that
> suppresses console output and doesn't log a message.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/migrate.c         | 11 +++++++++++
>   lib/migrate.h         |  1 +
>   scripts/arch-run.bash |  4 ++--
>   3 files changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



