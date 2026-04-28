Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6BBFF885A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LE8UInZOXpNQg4yh/Sw735LkwnyuZMKIDljBA/lkPtA=; b=GZqCEDlCgzrMV9
	eDTUFpy1amcSg6ix1D/ikLwF7TIozrbv6A08KbtI8Rby1PKAkEtRTk/cPCQC6JDstOOD1Y8kidOA+
	m4RiMobRan7ajctnGH4KUeXOBzFa9kiPShkR7f10BaLuwHtUttnHSSy7SsqBpSGkYina9EM1fS6Kp
	pvZeYLbuFwzI3PReLGzmVDuEUHj50Oc0HkN8josioKLJcqWnx/5fgzSy4h87aynUVB8UDX/O92N0C
	TYuWrZ49dsNgvI9iHL2aBBbDFjkPqNZUbQHu1Vaw1f+p5K0kYlBcCgkYl3VsYemEByW7eL8lAPatr
	HLAMkLzIShosLkJXbDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiZ8-00000001YLc-3VX5;
	Tue, 28 Apr 2026 13:33:30 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiZ6-00000001YKs-1rBg
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:33:29 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-56a857578a8so4226840e0c.3
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383207; x=1777988007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OngaHwDgRXU8aplL5gx6iXCqNmM7ax8JTAiWS4ELs6M=;
        b=UKfl+mkXxz7lFYhLmBe7xnihmyUW5ZHsuuuWQVLaebXOKqYSwf6LS4RDmcrCeKWumd
         dJ0scKtQI0AaJhThMUvybajFi6J+7Y57yk77TGkQSMLf7+wVL671YQrjMueyq8k3pwx9
         RiyhpWIu8yJWRT+dFuIRCB70AIvFPce6l1XYRLPcs8m31LesBQL/zVgrgmjNSnpjbnVn
         gwXJuxqNDtoHJ7CRUFN6iifUoLTDMa3XGbBUgImbQ7CGvhFUnSJOagKmAPplDyCPbJbY
         DuLsRCQ/J8k8tsA3ec1vf2mSaYJI7By0NRn8pkQgOgv+PfhffbQ4za5l9y+zzE1BHcE0
         QY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383207; x=1777988007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OngaHwDgRXU8aplL5gx6iXCqNmM7ax8JTAiWS4ELs6M=;
        b=OCXgSeg8ttc7CEYAO43OXhCGW89KPM0gJiIWdCWEGh1PpZ6pNtUVorKV6K9qTjHl7x
         VYqJ4O2q5LXKCVX1PgIWfyAhdIrvd9Ja0kigV1UI6mpYrbOv2y9mNJVJ1Hu6PV2s4EfO
         PxE+oWhGRwC4MobpQqp0wcGTIR6fcZ0P22MlWdd5L/wjuyADIRsrrx+EH5FbP9YNV/Z7
         shvdQxoomT9tsjRRx+dGUxz1nWpLynRJRtt+eb6wMl+/LB23W5cJnPf1npHkTsvVPj4v
         ezxswfZUwQP+C+GpLNTdKdBIXy4DPTfPZ1zf7A+HmduJZFweXK6PXNF7ZFqwDwt1QxPf
         zLrw==
X-Forwarded-Encrypted: i=1; AFNElJ87FNUhBmbu72nIwNMl5+WuhaW0XQuLn/BcJp5exbcbN8gdFpzkC/l7lQvbNeMXGtLzhqy3d9aaoAc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQp60EcrNLlrRllU/nGZON3TAqNOYl+AhZH5y0Cp7FRl8oCjjL
	XQMn/xFQNO9tCVqp/m8vwa3pIiZrNijGjo7IqPGEM/DSJtxNkGqBvHgwfWkDz105AtY=
X-Gm-Gg: AeBDieu/leOiI/z+JjpSArtr17kOVa8eQRWIspyUw+vU9UQ8XyQJ+q4Vq1gmowV3z2P
	Ck4wDf1UHeUiJW/1pIKtDEvQ3KJ8U5Ewrf/dWm3qoYAyB8KqoP/ffS2L+TmvcTMvn2pHi5EqlRa
	5EIQs/UowaSJ2CXJeGBwLFkvKE6DYztIo3IyYmT+h/p954zxWjLyC5YKAg3+JR09Aj6ufLnIOOX
	P/zJnzfoVPbTp1A8/gfCW+aQbP6x6xm/X4nZfBN99hGvtuGVwg+v5Q1iHoK4cq36rrYdzdgxvHy
	Vgg4Gqfn0dSdzyUDpvtjuOGVkEnO3lWoKQMAlHUjLcsys6lqQUzHBDJvWf8R01bitm9cK9Zp3l1
	7FDqteFy5bpxMMx8dZWOiWkfi5FA+8p455DkW/B+nsoGe7kw6tHXZjK/++9kvJTPOpq6L4LbEAj
	mie/LViUjvjZaIKLormt2F7bJ1Xec8g9g1I6rA/kcTgeVS9vyppkJfSi1Dz7euF9Ahj/y5WsuZ2
	qbWVUJES+ahW7QC
X-Received: by 2002:a05:6102:f09:b0:607:4fe2:a647 with SMTP id ada2fe7eead31-6280afc7cc0mr1065240137.21.1777383206848;
        Tue, 28 Apr 2026 06:33:26 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2842bbbsm19645216d6.11.2026.04.28.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:33:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHiZ2-0000000AhmN-3Msg;
	Tue, 28 Apr 2026 10:33:24 -0300
Date: Tue, 28 Apr 2026 10:33:24 -0300
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
Subject: Re: [RFC PATCH 02/11] iommu/riscv: report iommu capabilities
Message-ID: <20260428133324.GD849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-3-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063328_486718_36F4FC2A 
X-CRM114-Status: UNSURE (   6.70  )
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

On Tue, Apr 28, 2026 at 09:13:50PM +0800, fangyu.yu@linux.alibaba.com wrote:

> +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
> +{
> +	switch (cap) {
> +	case IOMMU_CAP_CACHE_COHERENCY:
> +	case IOMMU_CAP_DEFERRED_FLUSH:

IOMMU_CAP_DEFERRED_FLUSH is not needed in v7.1

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
