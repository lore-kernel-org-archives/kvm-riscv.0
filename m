From: Philippe Mathieu-Daudé <philmd@linaro.org>
Date: Mon, 8 Apr 2024 08:28:16 +0200
Subject: [PATCH 4/4] mm: replace set_pte_at_notify() with just
 set_pte_at()
In-Reply-To: <20240405115815.3226315-5-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-5-pbonzini@redhat.com>
Message-ID: <2e481816-2b06-432c-b09c-e92e230debe8@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/4/24 13:58, Paolo Bonzini wrote:
> With the demise of the .change_pte() MMU notifier callback, there is no
> notification happening in set_pte_at_notify().  It is a synonym of
> set_pte_at() and can be replaced with it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/linux/mmu_notifier.h | 2 --
>   kernel/events/uprobes.c      | 5 ++---
>   mm/ksm.c                     | 4 ++--
>   mm/memory.c                  | 7 +------
>   mm/migrate_device.c          | 8 ++------
>   5 files changed, 7 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>


