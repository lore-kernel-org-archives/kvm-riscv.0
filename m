Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2BCC021B2
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 02:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45OGYGDgFxEFjZLT3JOCgDi10bljuUsNnBg9JkiSFo4=; b=fH8qwdcPfjV6Xf
	xYn3iV/QiiYpj3Rad4SKiDM/MSo3mewha95zz+CWx+t5Vxw1lMrniSMyyByw9Y8iIlJeuBCd7Uw7w
	oKE/rTxLisqTBnDbMnw7CXeZ1bzorxPs+b4tG8WVmADgLqUJ2Z6Z2x/KqqkcfzojYbLDjID/9zWwI
	lBIaM2cG4/E9W2mJ4QNyzRFRNiGCNxsmb0eCizf00KhKW58zLr8lr0NGKMn/UVGhQTtF1ZF6MZ8E0
	cWW1YP1dDVbGvCOij6qBnZR2ybAnoutO55AiUmaR1xKi9mRtJbhYuOB7wFRqYpvHMK3P5tPU7K4sp
	yl2HFMPkb50R//cajFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlImN-00000003qsc-1UL5;
	Fri, 21 Feb 2025 02:28:39 +0000
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net ([165.227.155.160])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlImJ-00000003qrl-2B52
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 02:28:37 +0000
Received: from duchao$eswincomputing.com ( [10.64.112.210] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 21 Feb 2025 10:28:27 +0800 (GMT+08:00)
X-Originating-IP: [10.64.112.210]
Date: Fri, 21 Feb 2025 10:28:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Chao Du" <duchao@eswincomputing.com>
To: "Andrew Jones" <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, anup@brainfault.org,
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: Re: [PATCH] RISC-V: KVM: Fix comments in
 kvm_riscv_vcpu_isa_disable_allowed
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241010(a2f59183) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20250220-69956156f8489f179d3ed97d@orel>
References: <20250220074905.29014-1-duchao@eswincomputing.com>
 <20250220-69956156f8489f179d3ed97d@orel>
MIME-Version: 1.0
Message-ID: <10c88f03.11fe.1952655ba39.Coremail.duchao@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgA3WxHL5Ldn4gQnAA--.1946W
X-CM-SenderInfo: xgxfxt3r6h245lqf0zpsxwx03jof0z/1tbiAQEADGe3WNkL2wAAsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_182835_885761_72EE85B9 
X-CRM114-Status: GOOD (  18.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 2025-02-20 23:54, Andrew Jones <ajones@ventanamicro.com> wrote:
> On Thu, Feb 20, 2025 at 07:49:05AM +0000, Chao Du wrote:
> > The comments for EXT_SVADE are opposite with the codes. Fix it to avoid
> > confusion.
> > 
> > Signed-off-by: Chao Du <duchao@eswincomputing.com>
> > ---
> >  arch/riscv/kvm/vcpu_onereg.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> > index f6d27b59c641..6df41794e346 100644
> > --- a/arch/riscv/kvm/vcpu_onereg.c
> > +++ b/arch/riscv/kvm/vcpu_onereg.c
> > @@ -203,7 +203,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
> >  	case KVM_RISCV_ISA_EXT_SVADE:
> >  		/*
> >  		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
> > -		 * Svade is not allowed to disable when the platform use Svade.
> > +		 * Svade is allowed to disable when the platform use Svade.
> >  		 */
> 
> It was correct (but confusing) before this change. When
> arch_has_hw_pte_young() returns true, that means we can use
> SVADU (which is !SVADE). If we don't have SVADU, then we must
> be using SVADE, and therefore can't disable it.
> 

Thanks for the clarification. 
I had some misunderstandings about the relation between SVADU
and SVADE.

> How about
> 
> /*
>  * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
>  * Svade can't be disabled unless we support Svadu.
>  */

Yeah, that's better.

Thanks,
Chao

> 
> Thanks,
> drew
> 
> >  		return arch_has_hw_pte_young();
> >  	default:
> > -- 
> > 2.34.1
> > 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
