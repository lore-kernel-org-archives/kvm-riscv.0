From: Philippe Mathieu-Daudé <philmd@linaro.org>
Date: Thu, 10 Aug 2023 11:04:14 +0200
Subject: [PATCH v8 04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
In-Reply-To: <20230808231330.3855936-5-rananta@google.com>
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-5-rananta@google.com>
Message-ID: <a645ce3e-dd24-8c06-5898-76f78828b608@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/8/23 01:13, Raghavendra Rao Ananta wrote:
> kvm_arch_flush_remote_tlbs() or CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
> are two mechanisms to solve the same problem, allowing
> architecture-specific code to provide a non-IPI implementation of
> remote TLB flushing.
> 
> Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> all architectures on kvm_arch_flush_remote_tlbs() instead of
> maintaining two mechanisms.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   virt/kvm/Kconfig    | 3 ---
>   virt/kvm/kvm_main.c | 2 --
>   2 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>


