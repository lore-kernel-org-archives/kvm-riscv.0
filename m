From: Thomas Huth <thuth@redhat.com>
Date: Wed, 24 Jan 2024 10:33:30 +0100
Subject: [kvm-unit-tests PATCH 01/24] configure: Add ARCH_LIBDIR
In-Reply-To: <20240124071815.6898-27-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
 <20240124071815.6898-27-andrew.jones@linux.dev>
Message-ID: <206d5e08-b056-4baa-9e87-37812702ece6@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/01/2024 08.18, Andrew Jones wrote:
> Prepare for an architecture which will share the same lib/$ARCH
> directory, but be configured with different arch names for different
> bit widths, i.e. riscv32 -> lib/riscv and riscv64 -> lib/riscv.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   Makefile  | 2 +-
>   configure | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


