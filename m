Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98B7CD4851
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peiAQHqKWh1pSR7HqIcXiv9R1vU3BhvRxSPC+To55eI=; b=OyC8NfQi2DvtF1
	BKUQBBK7uzeJQxRqjEzkKoJXrq2vV9UD6KAvXzQyZP8QHmEZzn9nkscZDgAFKxEnHK86sPPjC2U0G
	jEcB9AJUZQsGdAdFTXKUjBwwFBJSjDXevNs+tQBim+A/QVmGnOmZfpVSkt0C4UpzNdAL+yLgSJHp6
	+SCDPHDFHAXtPvlkTuzdvGlus9l/TZr/pMh6TuZLw677RLa0/cSxl3JUkRShxLUHFUpwp9Mv+NL1L
	84pMG9fHifKJxk2Y/4jaEbOtJtcTn83Lys6LExYnZ2/TeZd8LVeiCKaB0IIeGnolwD8Vv8aC5iPCz
	l7BfFA98hvhd/i9nhLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnGI-0000000Gs0z-2S6z;
	Tue, 12 May 2026 13:35:02 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnGF-0000000Gs07-3JQI;
	Tue, 12 May 2026 13:35:01 +0000
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 02FE31C43F3;
	Tue, 12 May 2026 15:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778592895;
	bh=jjz4N/GGlrb20534eHVIphQQrJEKSFpH4yDwShWTwQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sc3UjSZtLQIb66Nkh6P7R+uLmlUFCxxateKtnrXfHi2yv55nnr/bVEyLvHtYukwAg
	 GJtXaq6rI9h0Ibsp28G6WrRma7ygnRZ9Xx25WUf0/nN/k8DZxtNIaZXVQp+Fzr56qY
	 LyWIy3vn1QckIAOd9Jw8/moYiBTxm62gE4PcHV8h1DHdQ+w6OHm4U6g1eM72xTv9PT
	 somkFoI3FL/ighz1b+g2jpLRNWOTxLMliOovXezzq66m+rn2MvHxtVqcWW2TBL9C9X
	 z/mSsFzLfIFUmKO6VTW2d/8hYouQv3Whx9sPb48k9KaLQ7hwZVwJpbewzFR301pxVi
	 0hBR6d6TWz4tg==
Date: Tue, 12 May 2026 15:34:53 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, kevin.tian@intel.com, baolu.lu@linux.intel.com, 
	vasant.hegde@amd.com, anup@brainfault.org, atish.patra@linux.dev, skhawaja@google.com, 
	jgg@nvidia.com, nutty.liu@hotmail.com, guoren@kernel.org, 
	andrew.jones@oss.qualcomm.com, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] iommu/riscv: Support Svpbmt memory types in
 generic_pt
Message-ID: <3jtnhvij7vv2wjep42sijdwy6ax4fr4q6w4fwpyh2cpgzvbpel@w42zuvjl5cy7>
References: <20260512074142.16356-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512074142.16356-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_063500_107314_0FB74936 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

On Tue, May 12, 2026 at 03:41:40PM +0800, fangyu.yu@linux.alibaba.com wrote:
> Changes in v4:
>     - Fix build warning on 32-bit configurations by using BIT_ULL() for RISCVPT_NC and RISCVPT_IO. 
>     - Link to v3:
>       https://lore.kernel.org/linux-riscv/20260417140746.97817-1-fangyu.yu@linux.alibaba.com/

Please send this as a diff to the patches which are already in the IOMMU tree.

-Joerg


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
