Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A894BCCA471
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+sNILtVhxe+s4N5opG6p1n0Btu/D2fOtSfxGGgjsg0=; b=ntkQo/elwjOLQq
	dkoFrTs8KwFCXXDJ1Fd8te833Z2rjJcguhmAat1iwg83HF5X5W2gcX5NUiX3JDA0aClrJOj+/8OAv
	HIFNWxh94v3kEw5I0W4MOJpAhQm8IWxDoOU+UyrlyidVIaJzbMBqYAzFp7iEmLst8+a0z9xa8ad9n
	V4fuIi3tn6LEeTchUAOdo+Ao3r5lOBAyqtTiwjSxV0IVTsTsgKbb1/cp/NQ84kKMVwIuw05XRQ2Gh
	SRWzpaz7f2w0FpZbchFHcaiWiYWfRRpIp+3oQR+Vp2kbyXiH4mjUYqq+osafu8g397yk700zJNQgw
	vwX6i2gYPWZ/w2DjoRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jW1-0000000CpeO-15bh;
	Fri, 03 Oct 2025 17:24:21 +0000
Received: from fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.132.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jVx-0000000CpcB-3E3D;
	Fri, 03 Oct 2025 17:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1759512257; x=1791048257;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=eKU8SJ09O6RAdk9rzTuf+EPgBar7M5OPCHBeslmadhA=;
  b=f5vI/2oSeIDW4VsIzPXPfIqF3OVeJuds+Yxo6bZqrUDE9e9/ktBky/3D
   TbaQp/sT7GDkj/yq2uyWqTrUzNr5RkNv0z9gclkDtExkmDCPjgPh5LwLa
   dfFnBu3qvJ6Tx3Hbk+HMt1w1847puEDWewVeT2tiG44LedTJr1jI+ER9q
   Djxq/3rbigkLTAIp+Zm76M8g3Nf58imda/JdjDh0gUglPmlAg7sx9Y9Vc
   BnofYvXSwmttXeqXpDNXtQcQPtVwkfzOJ0l08XdUy8V8wPp1aQgproTa6
   VtnKy730PYDsakHokgzkB26aHN4ahlB7K6zq6IL0P3qiydVaheAIde9rq
   A==;
X-CSE-ConnectionGUID: /bGeMqI5QHGO7ZeMBtXCHg==
X-CSE-MsgGUID: d1ZXsYzERHSwet8rfgRFpg==
X-IronPort-AV: E=Sophos;i="6.18,313,1751241600"; 
   d="scan'208";a="2975643"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 17:24:05 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:5746]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.33.147:2525] with esmtp (Farcaster)
 id f44c7b7f-75fc-43b3-8033-16cf4d5d0ded; Fri, 3 Oct 2025 17:24:04 +0000 (UTC)
X-Farcaster-Flow-ID: f44c7b7f-75fc-43b3-8033-16cf4d5d0ded
Received: from EX19D022EUC002.ant.amazon.com (10.252.51.137) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 3 Oct 2025 17:24:04 +0000
Received: from [192.168.4.149] (10.106.83.12) by EX19D022EUC002.ant.amazon.com
 (10.252.51.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Fri, 3 Oct 2025
 17:24:02 +0000
Message-ID: <fc0bb268-07b7-41ef-9a82-791d381f56ac@amazon.com>
Date: Fri, 3 Oct 2025 18:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/34] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	"Oliver Upton" <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
	"Michael Ellerman" <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson
	<seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>
CC: <kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Xiaoyao Li
	<xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, Chao Peng
	<chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen
	<jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, David Matlack
	<dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata
	<isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?=
	<mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve
	<vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, "Maciej
 Szmigiero" <mail@maciej.szmigiero.name>, David Hildenbrand
	<david@redhat.com>, Quentin Perret <qperret@google.com>, Michael Roth
	<michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, Liam Merwick
	<liam.merwick@oracle.com>, "Isaku Yamahata" <isaku.yamahata@gmail.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-16-pbonzini@redhat.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJnrNfABQkFps9DAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPOpfgD/exazh4C2Z8fNEz54YLJ6tuFEgQrVQPX6nQ/PfQi2+dwBAMGTpZcj9Z9NvSe1
 CmmKYnYjhzGxzjBs8itSUvWIcMsFzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmes18AFCQWmz0MCGwwACgkQr5LKIKmaZPNTlQEA+q+rGFn7273rOAg+rxPty0M8lJbT
 i2kGo8RmPPLu650A/1kWgz1AnenQUYzTAFnZrKSsXAw5WoHaDLBz9kiO5pAK
In-Reply-To: <20231105163040.14904-16-pbonzini@redhat.com>
X-Originating-IP: [10.106.83.12]
X-ClientProxiedBy: EX19D013EUA004.ant.amazon.com (10.252.50.48) To
 EX19D022EUC002.ant.amazon.com (10.252.51.137)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_102418_630216_C24D3685 
X-CRM114-Status: GOOD (  14.16  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: kalyazin@amazon.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 05/11/2023 16:30, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-based
> memory that is tied to a specific KVM virtual machine and whose primary
> purpose is to serve guest memory.

...
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index f1a575d39b3b..8f46d757a2c5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c

...

> -static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
> +static int check_memory_region_flags(struct kvm *kvm,
> +				     const struct kvm_userspace_memory_region2 *mem)
>   {
>   	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
>   
> +	if (kvm_arch_has_private_mem(kvm))
> +		valid_flags |= KVM_MEM_GUEST_MEMFD;
> +
> +	/* Dirty logging private memory is not currently supported. */
> +	if (mem->flags & KVM_MEM_GUEST_MEMFD)
> +		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;

I was wondering whether this restriction is still required at this stage 
or can be lifted in cases where the guest memory is accessible by the 
host.  Specifically, it would be useful to support differential memory 
snapshots based on dirty page tracking in Firecracker [1] or in live 
migration.  As an experiment, I removed the check and was able to 
produce a diff snapshot and restore a Firecracker VM from it.

[1] 
https://github.com/firecracker-microvm/firecracker/blob/main/docs/snapshotting/snapshot-support.md#creating-diff-snapshots

> +
>   #ifdef __KVM_HAVE_READONLY_MEM
>   	valid_flags |= KVM_MEM_READONLY;
>   #endif
> @@ -2018,7 +2029,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>   	int as_id, id;
>   	int r;
>   
> -	r = check_memory_region_flags(mem);
> +	r = check_memory_region_flags(kvm, mem);
>   	if (r)
>   		return r;

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
