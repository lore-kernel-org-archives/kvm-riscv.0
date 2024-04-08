From: Philippe Mathieu-Daudé <philmd@linaro.org>
Date: Mon, 8 Apr 2024 08:31:07 +0200
Subject: [PATCH 2/4] KVM: remove unused argument of kvm_handle_hva_range()
In-Reply-To: <20240405115815.3226315-3-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-3-pbonzini@redhat.com>
Message-ID: <d1ad8803-16a9-4fd8-bc9c-8d38171a2554@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/4/24 13:58, Paolo Bonzini wrote:
> The only user was kvm_mmu_notifier_change_pte(), which is now gone.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   virt/kvm/kvm_main.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>


