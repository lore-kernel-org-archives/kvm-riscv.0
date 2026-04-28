Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763D2FF885A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24oq/2iM6BMe1cB2ulBOVkmVuWAI3gSeTGKOM60F1cE=; b=jWGqZY+pJYpcbR
	abXq40AFe3v6MhNUTj6IsC3SHvyqMww+vuihV89Hd09V3Mj4hL3wAE+/otuJobhdLReUVzkN+oFJF
	qQJpCHO/gwamV7XH7TyBus5IZVFGfAkFJohUrN1V3KpCRSoKP0gziaqq2qNHH1NSu0AtvpaAljfz0
	G9vwx3XpKWFFioRpyz71QCStQI/O0rOfPy2v0irYIBgoBPLHAgeEmS3N8WJrbJJlCK3pVpPaPL2De
	z30JVdggRDvW9duzfysDoWhRz5QLpulgvzUJamUdbfV0mtjSW9gxGq3ClFj9uX1Prxw6dnnZw4WZG
	KKmBUQsZiHjTJ528E7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHicK-00000001Yra-1gwu;
	Tue, 28 Apr 2026 13:36:48 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHicH-00000001YqP-3CfX
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:36:46 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8eae9229110so1534585585a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383404; x=1777988204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ19NsW5fr6ajdZR5D4lYg3z8k9sQDPcT96d4+jJChg=;
        b=eRm08gVyBhZm/Xtru/+cHNU5LitwwknRsofeZlhh4WfuU/ud0TK1L7Mce0DN1z2sql
         5nFimdy+ELICD0skGynK4nEbY1/i5HTtgE9G9DqWvyjzWTlFrwxLiqCZj3RF6vQ8FYBx
         3ADW1+O75PiYyTMaXWMaNQ/qd+l9nux2QIllTh8ZE49A/N/y9bMTK+PvrrCrqiHLaS5l
         l+qDfURqwFI6QWzQem7v/AmLJ6l1th/EvN16AkrZEM6ephTCjh3ejwmXhdhM/XpskKE2
         CxSjz6cxNSErud1cBUVk2jLiKUSU5YJ/e4gELrwuOy35g1XsBMy61QlGCVJ9rw9UxvOV
         0aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383404; x=1777988204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ19NsW5fr6ajdZR5D4lYg3z8k9sQDPcT96d4+jJChg=;
        b=AmMPpxVWiZr+zKRJUOo3OHxRpYh/GBMQot9LS4zUGcoiGwMwn1pr9oqoA2EnzNbHLU
         Wqo0T2vdjJRK8CJ8FhPLo3ufrWkmdewTwEp9zYOSh64peKIUB+RD09ROo/XDN23miWYz
         AIRcLplIEXBmuh909/Mj/l6F4X0b0uptEeUdaGvpTqMy7O1JlWo+joY7bcjTtAKHPMTq
         nKI25FpdYtjytA3NX73UC64IToiVBs4lMu4Wg1PGViU5oC9WrwABeCpzk+B5AqFVhI07
         ZhLqq0cgmzNaKyfyFsyuqJtQMcXPaxjpYOjLCpa9j/0OAgT+G21RD44AIjtfwyESMeqa
         ITTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kZNSSgg+C1y+xk/KZza7bqO/OpDsUncx7+WJw2Pa4MNCQ2054V/lI8ejLDhCIwrMuRvqYT7Ky2uI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoSsynsk19s/O/cuYXJta65Dl0covHNg5XNMetOZWyAFtslmzO
	9VRoljEMoLX7mUw/XYtqvpAdpTwK4AMJxkR51+dynyr0ZTFnWjvzgT5/UcmcF4dbiMc=
X-Gm-Gg: AeBDieuhtfp4cXnWW+z75ecQ8kpSe3jFlbjLZqxMJbPTVZWA0T0+yRdFmsANuu/IrgX
	TzKr81jyVgCu2ib5FVuK+va9e4elJps+IuH0r1VVt5RZ/YyYLc0TGXB/T8c1VPBMAPd9nKdrqsQ
	GAHRUorQXXuSjog7tvGGTsVp4eCxt1FEqNjYmb5D8ONG5HVbNBgZe217cSbuTX2UkS3QkA35Jny
	eKeR1/gGxh5bjuw4KCTsmD6XimUDtGRE5zFc5bIxx+Kw4HJn4OG9jRGy1NDVHU+eeBMe9CMpLWf
	VSzkIXC+TXp1brPs+ReD3Y2WgFkzZ/OQF1vl1CZwvyZdEhebJ6reI01LX6A3U8RRllnNcxULSzS
	ZYmM25vEJaDXOX20FIEqnTeNf3HG0aNORk0cJzF1oMi71F882WZUqBJ5z4IUQZTf+DDVtdvDK2g
	Jz5P+qpnp4cTgapwqbOmN4rQiNlWX7Ex5uPWGdP7uAm7EZhfk/Wy7YLUaacPHtFOfv3ZVxqlovW
	gjJ8ci2V4divWIJ
X-Received: by 2002:a05:620a:4002:b0:8ec:a621:a3af with SMTP id af79cd13be357-8f7d7d17f49mr430093585a.27.1777383404115;
        Tue, 28 Apr 2026 06:36:44 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c7cd2becsm194526285a.29.2026.04.28.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:36:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHicD-0000000Aii6-3yTF;
	Tue, 28 Apr 2026 10:36:41 -0300
Date: Tue, 28 Apr 2026 10:36:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 07/11] iommupt: Don't preset D when RISC-V IOMMU
 dirty tracking on
Message-ID: <20260428133641.GF849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-8-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-8-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063645_805066_ED735CEC 
X-CRM114-Status: UNSURE (   9.00  )
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

On Tue, Apr 28, 2026 at 09:13:55PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When mapping writable pages, the RISC-V format code currently
> pre-sets the PTE D bit unconditionally.
> 
> If hardware dirty tracking is active (DC.tc.GADE set), the IOMMU
> sets D autonomously on the first write. Pre-setting D makes every
> new mapping appear dirty immediately and breaks dirty tracking.
> 
> Introduce PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE and, when set, leave
> D cleared for new writable mappings so hardware can capture the
> first write. Keep pre-setting D when dirty tracking is inactive.
> 
> Only meaningful for second-stage (iohgatp) page tables.

You shouldn't need anything like this, the D bit is managed by the
iommufd core appropriately. It *should* start out pre-set as that is
faster when not tacking. Only once dirty tracking is started does D
get cleared. User space is supposed to assume that everything is dirty
prior to its first D clear.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
