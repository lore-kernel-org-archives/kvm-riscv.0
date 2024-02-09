From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 09:28:21 +0100
Subject: [kvm-unit-tests PATCH v3 5/8] arch-run: rename migration
 variables
In-Reply-To: <20240209070141.421569-6-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-6-npiggin@gmail.com>
Message-ID: <cf01bf0c-ad31-4bb8-918f-98de47d40d7d@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 08.01, Nicholas Piggin wrote:
> Using 1 and 2 for source and destination is confusing, particularly
> now with multiple migrations that flip between them. Do a rename
> pass to tidy things up.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 115 +++++++++++++++++++++---------------------
>   1 file changed, 58 insertions(+), 57 deletions(-)


Acked-by: Thomas Huth <thuth@redhat.com>


