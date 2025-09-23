Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B137CAC5AC
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO2ba4KoSEEnDQ5sLQG+72AItyuHcQoe8sQGOnlklqY=; b=aGid8EljSHY6rU
	dg3dm4DVXiLC8vsytU3+zK7tWmuxYv6YlcYCaTOAtr63Fk6YspdzD4zzbGlmMLAERlHkRXBIywC+t
	pOGLbH7yJLpxTbhiMt7Xs9rzogYzqtH0CpxhH3fREB6ExkwBdc8suc23xRLXbfOBBIcNviiB54vb5
	wrDrjtEjzlQz4ZETMaM7thp4eKyi5ZFmDdRkrNXPSPap1Nkno0hgSE2FSNPW1EvojM4teJiPaox1V
	KUQmVxgMYiSdW7rLr6cOkEpeW5CrMPIsqNQvqrGY0Q1OuxyCJOFGzydwLqLMKZt6Er2pSuPY9d1iI
	FiGDyPpHbtVwhYOjjCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14hE-0000000E0f6-369X;
	Tue, 23 Sep 2025 15:12:48 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14hC-0000000E0e2-0Pev
	for kvm-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 15:12:47 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-eaf8e85f66eso1763652276.2
        for <kvm-riscv@lists.infradead.org>; Tue, 23 Sep 2025 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758640365; x=1759245165; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcoDQc5Q5w0LSP8tWH7zt/4vlU+pjxCSOZ2lxuUdQv4=;
        b=OQSMYMm3izgu7+lMPWPLWCgwU19gVQ5j0yMT0QCf/PsR1L9PG+Lco+GY/O3QrJrgOy
         KPFCMZOkB3ne3+rfsxqMpRQgecy48pt9lOqrhhB5HYMCV2pZVIPTckKmY9JpdZhMYxtO
         tjvFspmUrBmH41/0oZa8yoDi10ggZVBU8K1/4HcOPlW9tOVIaDFjHyw0fRnqQKTybSOf
         FezCQDg4uNwPXAXa2dv+S4eD7+VMTnyPyTMKNkDPDFxhboWn1ekoJD4gupgM+I4DYwr3
         aw0BBlVVqsPpYdj3eI/gyR1mgW/JRCcDopt2ToQ+KZYqsbt/d+kugLhqgqyrL/ZteGgU
         LBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640365; x=1759245165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcoDQc5Q5w0LSP8tWH7zt/4vlU+pjxCSOZ2lxuUdQv4=;
        b=gWGyCBWAUf36I4KfJVabkzpKbxV9K4iLS/t7//6so+LxCVYjwS8uOY0Lvg/I41jdqY
         4ADnTH+FLdHE6WQV1znoiebcwf/xq2Kf6D7z3vwWP9utxFET8R2LjQpZ4VEFsz9BIsVx
         lrh5YjsLrnqRfQmB3i9b7BHbZag/hOyugtMVPB0tbd+Pd5PwrumDdI2kn7/WbrPV9Bn1
         G9JfncS3Wv3TrFWf8XAQ23rY48L04uyVCw1ZXgAUNyFcrMb4q/o23fiLfUadJekTxxpI
         2sji5biJU/OCzdKdEo6IpaLUYETBfuctR4DhLIyrXiBInOWV7tq/y784S4AxqbQJQPDR
         ztUg==
X-Forwarded-Encrypted: i=1; AJvYcCUSINMPpMPW4j9T+M8zxqpj0kqNsNbjaT+3drFMzljB60WzJVN4WqjUkslyD1mR/MQ5E38z8NLi/uY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrVx0FHsWawvGfpMDgVwKzx2stxW0FIcwoXbsPB/hdww41ErkW
	NOaAPfBfx2aKD+OOy/iYzc4CCLnl23JYosdYbqK0Pv/zhsQ5XkHeAomVvhFY68NPFxw=
X-Gm-Gg: ASbGncvT77jUq2YPhlLIBoN0kbDV1vNAktSUXXLUJalBNJkQv6U3HC8TP1he/M0N70A
	DQ2jMRv3HPGrV4tgqr/OGz/6z2eLbKCbjLYe8nkBlAQOimf8WDd1oR1T99lVDcmTVE+nHCUp8xB
	grq3p3ln6Hb3jjSv2oKu5ue39kjl+rRTLNPLIPM4cLtX973HroY/ZSmahQc7u61mS4txmQ9ui7w
	2wcsEBxZPten/OrJfmRWXRlQ4THfDcKuDsJE3LiiRspplcY8POulr29rWWMYmBByH25H1k2cAwt
	qqhNd/oNYU24e+CeW9mVp8xAfnKigtWErBFwIxq//31Ux35lTOWLOqnvf5owBZv6X/Pp0uqBaEx
	IxYLpYRWEIbEHDqNMEBIOyG8xY4Wtd57JmIg=
X-Google-Smtp-Source: AGHT+IEMS7urR+MAiaqL/uLW9oLtRDN0Kx2AZwEqvz53/Dorjr00baJwfX+lZDlIYthJJ5jr4bmaAw==
X-Received: by 2002:a05:6902:c0f:b0:ea4:302:9a8a with SMTP id 3f1490d57ef6-eb32e058783mr1870670276.6.1758640364669;
        Tue, 23 Sep 2025 08:12:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea5ce974ac3sm5081124276.24.2025.09.23.08.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:12:44 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:12:42 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250923-b85e3309c54eaff1cdfddcf9@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
 <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923140646.GM1391379@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_081246_147940_C1FAF15D 
X-CRM114-Status: GOOD (  34.62  )
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

On Tue, Sep 23, 2025 at 11:06:46AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 12:12:52PM +0200, Thomas Gleixner wrote:
> > With a remapping domain intermediary this looks like this:
> > 
> >      [ CPU domain ] --- [ Remap domain] --- [ MSI domain ] -- device
> >  
> >    device driver allocates an MSI interrupt in the MSI domain
> > 
> >    MSI domain allocates an interrupt in the Remap domain
> > 
> >    Remap domain allocates a resource in the remap space, e.g. an entry
> >    in the remap translation table and then allocates an interrupt in the
> >    CPU domain.
> 
> Thanks!
> 
> And to be very crystal clear here, the meaning of
> IRQ_DOMAIN_FLAG_ISOLATED_MSI is that the remap domain has a security
> feature such that the device can only trigger CPU domain interrupts
> that have been explicitly allocated in the remap domain for that
> device. The device can never go through the remap domain and trigger
> some other device's interrupt.
> 
> This is usally done by having the remap domain's HW take in the
> Addr/Data pair, do a per-BDF table lookup and then completely replace
> the Addr/Data pair with the "remapped" version. By fully replacing the
> remap domain prevents the device from generating a disallowed
> addr/data pair toward the CPU domain.
> 
> It fundamentally must be done by having the HW do a per-RID/BDF table
> lookup based on the incoming MSI addr/data and fully sanitize the
> resulting output.
> 
> There is some legacy history here. When MSI was first invented the
> goal was to make interrupts scalable by removing any state from the
> CPU side. The device would be told what Addr/Data to send to the CPU
> and the CPU would just take some encoded information in that pair as a
> delivery instruction. No state on the CPU side per interrupt.
> 
> In the world of virtualization it was realized this is not secure, so
> the archs undid the core principal of MSI and the CPU HW has some kind
> of state/table entry for every single device interrupt source.
> 
> x86/AMD did this by having per-device remapping tables in their IOMMU
> device context that are selected by incomming RID and effectively
> completely rewrite the addr/data pair before it reaches the APIC. The
> remap table alone now basically specifies where the interrupt is
> delivered.
> 
> ARM doesn't do remapping, instead the interrupt controller itself has
> a table that converts (BDF,Data) into a delivery instruction. It is
> inherently secure.

Thanks, Jason. All the above information is very much appreciated,
particularly the history.

> 
> That flag has nothing to do with affinity.
>

So the reason I keep bringing affinity into the context of isolation is
that, for MSI-capable RISC-V, each CPU has its own MSI controller (IMSIC).
As riscv is missing data validation its closer to the legacy, insecure
description above, but the "The device would be told what Addr/Data to
send to the CPU and the CPU would just take some encoded information in
that pair as a delivery instruction" part becomes "Addr is used to select
a CPU and then the CPU would take some encoded information in Data as the
delivery instruction". Since setting irq affinity is a way to set Addr
to one of a particular set of CPUs, then a device cannot raise interrupts
on CPUs outside that set. And, only interrupts that the allowed set of
CPUs are aware of may be raised. As a device's irqs move around from
irqbalance or a user's selection we can ensure only the CPU an irq should
be able to reach be reachable by managing the IOMMU MSI table. This gives
us some level of isolation, but there is still the possibility a device
may raise an interrupt it should not be able to when its irqs are affined
to the same CPU as another device's and the malicious/broken device uses
the wrong MSI data. For the non-virt case it's fair to say that's no where
near isolated enough. However, for the virt case, Addr is set to guest
interrupt files (something like virtual IMSICs) which means there will be
no other host device or other guest device irqs sharing those Addrs.
Interrupts for devices assigned to guests are truly isolated (not within
the guest, but we need nested support to fully isolate within the guest
anyway).

In v1, I tried to only turn IRQ_DOMAIN_FLAG_ISOLATED_MSI on for the virt
case, but, as you pointed out, that wasn't a good idea. For v2, I was
hoping the comment above the flag was enough, but thinking about it some
more, I agree it's not. I'm not sure what we can do for this other than
an IOMMU spec change at this point.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
