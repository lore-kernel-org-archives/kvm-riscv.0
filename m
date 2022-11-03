From: Philippe Mathieu-Daudé <philmd@linaro.org>
Date: Thu, 3 Nov 2022 08:12:05 +0100
Subject: [PATCH 21/44] KVM: MIPS: Register die notifier prior to
 kvm_init()
In-Reply-To: <20221102231911.3107438-22-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-22-seanjc@google.com>
Message-ID: <9cec1cc6-5050-9fc6-46ec-a8984b8266a8@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/11/22 00:18, Sean Christopherson wrote:
> Call kvm_init() only after _all_ setup is complete, as kvm_init() exposes
> /dev/kvm to userspace and thus allows userspace to create VMs (and call
> other ioctls).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/mips/kvm/mips.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>


