From: Elliot Berman <quic_eberman@quicinc.com>
Date: Wed, 26 Jul 2023 10:18:37 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
Message-ID: <8f7ea958-7caa-a185-10d2-900024aeddf0@quicinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 7/18/2023 4:44 PM, Sean Christopherson wrote:
> TODO
  <snip>
> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> index 6325d1d0e90f..15041aa7d9ae 100644
> --- a/include/uapi/linux/magic.h
> +++ b/include/uapi/linux/magic.h
> @@ -101,5 +101,6 @@
>   #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
>   #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
>   #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
> +#define GUEST_MEMORY_MAGIC	0x474d454d	/* "GMEM" */


Should this be:

#define GUEST_MEMORY_KVM_MAGIC

or KVM_GUEST_MEMORY_KVM_MAGIC?

BALLOON_KVM_MAGIC is KVM-specific few lines above.

---

Originally, I was planning to use the generic guest memfd infrastructure 
to support Gunyah hypervisor, however I see that's probably not going to 
be possible now that the guest memfd implementation is KVM-specific. I 
think this is good for both KVM and Gunyah as there will be some Gunyah 
specifics and some KVM specifics in each of implementation, as you 
mentioned in the previous series.

I'll go through series over next week or so and I'll try to find how 
much similar Gunyah guest mem fd implementation would be and we can see 
if it's better to pull whatever that ends up being into a common 
implementation? We could also agree to have completely divergent fd 
implementations like we do for the UAPI. Thoughts?

Thanks,
Elliot

  <snip>

