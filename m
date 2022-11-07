From: Eric Farman <farman@linux.ibm.com>
Date: Mon, 07 Nov 2022 12:58:17 -0500
Subject: [PATCH 06/44] KVM: s390: Move hardware setup/unsetup to
 init/exit
In-Reply-To: <20221102231911.3107438-7-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-7-seanjc@google.com>
Message-ID: <9d5a57634244c268d20ac640e055cc0befd8a881.camel@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Now that kvm_arch_hardware_setup() is called immediately after
> kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
> kvm_arch_{init,exit}() as a step towards dropping one of the hooks.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> ?arch/s390/kvm/kvm-s390.c | 23 +++++++++++++----------
> ?1 file changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>

