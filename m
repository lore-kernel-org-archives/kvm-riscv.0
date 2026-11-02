Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB435606A339
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sIBRM+GA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hYheTBp3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=X9PqJQ2sWYkcSwp1azG79DU3SnEksJpfV3F/kwg9MfY=; b=sIBRM+GA0UcMsd/PnuM6KyiXlr
	FWh/dnzBg1vD1NqgCt4jLtgFGtW3McLSMCe5Pi/OdNPWX6ooMONOd0Ukf0p0g4sT5HO2yYf37Jqnr
	xy3cJRFL45AHs0T5jr6Yo8MwW9r+69uwEwl34tWFsnmC6QvJ0uWxSzEmw7wcRX6n6oknYHUi3d9rn
	9jsA9FmTh+G86n+mHyWUJ0ISCWtdxjhYInlfM5k2nv/uZ8agspmX7xFid+ERFplzeCOsI6syOV5KM
	xuMaReuzjMBmu+RxAVhD6YE2Bp5hCHapS+qXFdD5AzTixfMYvZI6e3lrmBCnwfprytZHtjE8NsMNU
	+IrD9omQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrrS-0000000GZoI-0AtB;
	Mon, 02 Nov 2026 13:14:06 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrrO-0000000GZnK-3tHa
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 13:14:04 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5361e313e63so35293411cf.3
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Nov 2026 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793625241; x=1794230041; darn=lists.infradead.org;
        h=from:rom:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQ6t+GMfhU5C0Rvm61dIpYM5RO8AvEBQYn2+KfQV/CM=;
        b=hYheTBp3IzfTgNhE+KBl9hokesHafIVQWqOtCsQ7TgS6YeerBNcr/5CyN285aPmRWE
         F35AaO8Yn3/YGMdDDWLfo1RqMna5FAbYTr8KZKmxFs6Br75tgm5faaEBdyeINrUrrpRc
         Moekigwv8QuQg5O6uiyzLBnc4xDmBL2ThUdEieIarIJRnYNRruz+NbN72ZRGatYbnQGN
         pn5ioY604c5ZN3hr8Etu//U7+gIw6uuOA2HtVD76ju4261WMhcDbm87X/Aj7gyPHtz5a
         wHUslbAvCEY//gd+snvMC9VY6602BeGEdnmBHv5h/N6Ml+R4X1s36UtgT8xgRdUd8Y+u
         Jlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625241; x=1794230041;
        h=from:rom:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQ6t+GMfhU5C0Rvm61dIpYM5RO8AvEBQYn2+KfQV/CM=;
        b=taYy8ne0ZTKbw/ImXKHkwc6ODx3tUX27slDY3uWHhlCTyLxdLu97dvZ0WtXpy0tYZq
         LhnyVPmAZBHtMPUwQ+HqWZ3uzSLTBdpAWiIJ4NY5DFoM5KBj+j6MmqwiimpukSRzsvck
         4RzfWqbF7O2uq8+95LJhQmfahXsgwSl/7wolfFDTJ6UurcmEuqSAsaPhbZJI5ll1Wdmc
         o0XDKRcS8Ez5ceaii48k837hlWc5fpl37i8xxuU84NqShRB05l/xJ2D58UwMhlux1M+g
         gWpIEMK1kxytEg+p8UEG8odYGniGb4FsO/KzwwxAVUl9O+rjCU33h3CJ15jxlvuewSTh
         rYbA==
X-Forwarded-Encrypted: i=1; AKwUvBy/bzf8rHA5ciQCIez+W5XRo/QXxnb+dw2gGs2QLdWOvfcwM0tSNwQpKm9a7C3YArMQ6pmOrwucX2w=@lists.infradead.org
X-Gm-Message-State: AFq9FYKJboABekTl8K4m4iavLL2eCKfVcF7xNhEzXXMu2+9dO/dJs2hq
	P2OoflG8QOOy6yRj+RBAsCTVvU4nMEMhsp6Iweva1DhyUFJjFoaUlzmv6B9K/iqoc6Y=
X-Gm-Gg: AYBFou2zeCpAYAmLy1hZYddRywJgNONGazHVI9BUXjBojGMHvZaJ0xZcpgs9zdUfw9r
	mTU3aZVF6LwJ04VsX99CFyOGnvW8JffqQjV+oitHLoBDy/KCL5NcruW5Hs+woBF4voyWSsyN97J
	u5cuxTc0XTeMz+3yz8aQvqGNw089PG0BfLz3YNVJwnP85ndB1+68GSPR4ipmu80c3OE5dfeAFBK
	87xXbsriZB3Tj2BysN0bGv37Ryow9XTFfjQ8FB17wuCOj6z2FwFm7xFz/Xf7pFydwsqGTWCtjI3
	ec3zBUtjFhpai9RPJ9qIkAICEmmT62Qrm00yCDV7fFBmL7yaUOgdNvjAOSgtndbJG+sO7MpFvVf
	AmP1aYybyj3lM+v80CnDw4vKIsACP/qN85ie2wwPuzeLT4iM6Lg7NqMZv1RUDjl6YxOsUt0lvD2
	BCxqQLGr9Yi2kABl5Qhf68xX/DYJp6Tq+eC8pkCsDjnJ6jNVMveOSJDQVGH0zm9a5IX/jBVtz12
	Ynq0kKtYg6lT0IoW5Hf68uBzxOIz/5jjk+4qWB/zlR4VA838WBrHHSUWBK1WBPwpIDw6P+/HXfI
	nA+PHG9yGWBAp+n0nPBVwJXrOMt6QeDgFkMMHFrY+ksQs9VeWUxhzhXUSdkoINM5whY4a87laqB
	0JJPHrlsDOhnUJhqC4xRbXG0U9y+fQPw=
X-Received: by 2002:a05:622a:a07:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-542b658df3cmr161864101cf.20.1793625240711;
        Mon, 02 Nov 2026 05:14:00 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5431246c7basm85036611cf.18.2026.11.02.05.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:13:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xNrrI-00000009is5-3yQf;
	Mon, 02 Nov 2026 09:13:56 -0400
Date: Mon, 2 Nov 2026 09:13:56 -0400
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: fangyu.yu@linux.alibaba.com, alex@ghiti.fr, andrew.jones@linux.dev,
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
	baolu.lu@linux.intel.com, guoren@kernel.org, iommu@lists.linux.dev,
	joerg.roedel@amd.com, joro@8bytes.org, jroedel@suse.de,
	kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com, palmer@dabbelt.com, pjw@kernel.org,
	robin.murphy@arm.com, skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn, tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com, will@kernel.org, zong.li@sifive.com
Subject: Re: [PATCH v6 09/10] iommu/riscv: Add dirty tracking support for
 second-stage domains
Message-ID: <20261102131356.GA274202@nvidia.com>
References: <20261031083014.15040-10-fangyu.yu@linux.alibaba.com>
 <20261102091823.54287-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102091823.54287-1-gong.shuai@sanechips.com.cn>
rom: Jason Gunthorpe <jgg@nvidia.com>
From: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_051403_115549_570303FD 
X-CRM114-Status: GOOD (  13.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 05:18:23PM +0800, Gong Shuai wrote:
> >@@ -1439,6 +1454,9 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
> > 	if (domain->gscid < 0)
> > 		return -ENOMEM;
> > 
> >+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
> >+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
> 
> This sets dirty_ops based on whether the allocating device's IOMMU
> supports AMO_HWAD. As I understand it, the domain/HWPT is not tied
> to that IOMMU instance. A later attach may target a device behind
> another instance without AMO_HWAD, and the attach can still succeed
> with GADE disabled, potentially causing guest page faults.
> 
> Shouldn't we therefore revalidate AMO_HWAD cap for domains with
> dirty_ops and reject this combination?
> 
> FYI, both AMD and Intel have attach-time dirty-tracking checks. See
> drivers/iommu/intel/iommu.c:3195 and drivers/iommu/amd/iommu.c:3221.

Right, need to check on every domain attach that the domain is
compatible with the iommu instance.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
