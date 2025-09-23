Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B9CAC5AC
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGYOEhkYZpTQowqfOfiO28AypGYeAsE+gA/olggV2JI=; b=NSgy0f3yNVvDSa
	89QmbBZR0Voin7e/B+T+Pu19JoUiTdFUAxdXJ7kCCetHn7RVGMe0C7MEFg+wRLwtD3RifLpqvTtyk
	OAW4JmfC0mGN1Lws5aFFt+nqBj7XQbZySNXn8Pi51wJO+6lz2pD7BzECjfsLRRe8+qfpUNPnp+Km9
	DTNf0GiWb/6s2YdTJlB7EiOYGUz3Mnh4iIfQ70ZzzfYvYWHjYOOteCTrS7LWFhgnFDzim6tchnkO8
	YOkyDCKY4NXTjOgfoxOito5F/autCJwDvyaxZ8HRH/lSvUi4Y8bS37EbwjmhctVVXFl22/cbcYRfg
	IEVYin0zb+xBeG1N1N4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15ID-0000000E99w-1OvA;
	Tue, 23 Sep 2025 15:51:01 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15IB-0000000E98x-1ZeC
	for kvm-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 15:51:00 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-633bca5451cso1990598d50.1
        for <kvm-riscv@lists.infradead.org>; Tue, 23 Sep 2025 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758642658; x=1759247458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CqX8wo4OIF9dVnHcV+vNQ/UyqzH0cRogmJfYlIiKHQ=;
        b=QoI+58+qHjYEZnt57GzRyoJ0belS4KVQPbf5Sy04LKZBODyEBji0iZeX5zVXNLY3vA
         2VGGBmUjfiblc3jUzY8+OQC/a4p8WcdfTdO4+Jr2ivq6bdzsMb71riHmvE84+KgNgyiC
         AmiXcnOBoy7NwYBMdU4esHGWbmMM7QPUbdNZpN8U93Hir5RiWkir7nS8mjrsfbBsHYHZ
         xrVMG9tPtiUlphS1IGlzh8Am+5sSK7vsrBbpm8FqHWQ8wWInPLmQm7Q/uBPJsfqPRGRR
         MPp1B2wIqA4Ni2hKWGdnnazeo91SSisEmygfsy/GuC1R0fsYSIsN6+yL3SCL5T9tWO0d
         8kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642658; x=1759247458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CqX8wo4OIF9dVnHcV+vNQ/UyqzH0cRogmJfYlIiKHQ=;
        b=BGQB+FXFI/IPRxAHtAs/Q0053M91DVqEjIBAtXA0Fcma21jHVyi0CeGBEwCNDrMPFw
         n0FbFOXun14I7PbyIFyqiHApeX9VCUOhWwt8H0cgnuIl5/HAhFi4IJvuxqq7UuwY5+sZ
         kXNaqfkLwgpzOwM8I1qGpmfBR0mv5+kYBvt7Vu44vjdSoBHZiZZXg+U3+H79c+Mez8Ym
         ICzuxx5X8ELGQs0pai3JgyJFt1sLb4hJCjfyVZMLtIDz4oK7uGANbvG/a+8s5KwHQspI
         7LdHN7Q5qk7iV83ooLHyjzailCveelyF5xFXSrDl3HNVYfSosZ/0dm1Jh1GgrFwklH7W
         pqHA==
X-Forwarded-Encrypted: i=1; AJvYcCUs4HnExDuN1JiMY0TAJuPy8KuCS6AsMcUsQGy1wiSls56UMz80M0euzc6MChkWCkzqscZoxcCY8AA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrtYLu08YknvBZWDzpNPWbD7gGtseiqO8jJN8igaitIrro3gHC
	cW+/Qg4xvNsQMcWc7BAHtC94CVS+4TtyuMNU+WQnS8CRXRlL++F02wOPfC3aXzMVUdE=
X-Gm-Gg: ASbGncvHH1B7+tRC0xSZ6fIMmmhYsNaY6UJQ1UkkqzEBP+4mhBW25OsSmhkwtYtn/w0
	FwOr+qgh/5GZMwEe7z3s8h90Y6LpnzJL4a9o3+RM2GD6pb2NvYy/FX/uUuupmjC5GIuRDx9LvJv
	Tuyr6hwJziQEEZpSTCjmME3Eo5u8ZinRFIX7WL8X+EDXof/YLNBXp7hpDe9++R1lD5VKCy4bZ1l
	kyLeadGJOLYln+9Sktcf3UlrefTYPl+tL0GXh6L/OiY9PcmBiFLWS/YpciLsvsPN83IyhUzRWHb
	AWcyyE2qbrfRzyZzub0+irz022e3bJfSBsjFLK4gClLTc5l2GqZUqKu2s0GNh1b3LIUTco6iWSn
	JcQgBxoazQCYgUEhLm9JUJK7P
X-Google-Smtp-Source: AGHT+IG9zvGVFr+YOmFk29/0ncfJA3SG76AOSrmrzmJdcjBUK8KbuId/KM4G7ZMmRoUwWwnCaf4a6g==
X-Received: by 2002:a53:83ce:0:b0:636:3cc:28b2 with SMTP id 956f58d0204a3-6360476fce8mr1873137d50.36.1758642658091;
        Tue, 23 Sep 2025 08:50:58 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-633bcb601d6sm5411190d50.0.2025.09.23.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:50:57 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:50:56 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250923-e459316700c55d661c060b08@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
 <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com>
 <20250923-b85e3309c54eaff1cdfddcf9@orel>
 <20250923152702.GB2608121@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923152702.GB2608121@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_085059_434468_1332ECED 
X-CRM114-Status: GOOD (  27.59  )
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

On Tue, Sep 23, 2025 at 12:27:02PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 10:12:42AM -0500, Andrew Jones wrote:
> > be able to reach be reachable by managing the IOMMU MSI table. This gives
> > us some level of isolation, but there is still the possibility a device
> > may raise an interrupt it should not be able to when its irqs are affined
> > to the same CPU as another device's
> 
> Yes, exactly, this is the problem with basic VFIO support as there is
> no general idea of a virtualization context..
> 
> > and the malicious/broken device uses the wrong MSI data.
> 
> And to be clear it is not a malicious/broken device at issue here. In
> PCI MSI is simple a DMA to a magic address. *ANY* device can be
> commanded by system software to generate *ANY* address/data on PCIe.
> 
> So any VFIO user can effectively generate any MSI it wants. It isn't a
> matter of device brokeness.
> 
> > near isolated enough. However, for the virt case, Addr is set to guest
> > interrupt files (something like virtual IMSICs) which means there will be
> > no other host device or other guest device irqs sharing those Addrs.
> > Interrupts for devices assigned to guests are truly isolated (not within
> > the guest, but we need nested support to fully isolate within the guest
> > anyway).
> 
> At least this is something, and I do think this is enough security to
> be a useful solution. However, Linux has no existing support for the
> idea of a VFIO device that only has access to "guest" interrupt HW.
> 
> Presumably this is direct injection only now?

Yup

> 
> I'm not even sure I could give you a sketch what that would look like,
> it involves co-operation between so many orthogonal layers it is hard
> to imagine :\
> 
> kvm provides the virt context, iommufd controls the MSI aperture, irq
> remapping controls the remap table, vfio sets interrupts..
> 
> VFIO needs to say 'irq layer only establish an interrupt on this KVM'
> as some enforced mode ?
>

Yes, this is the part that I'd like to lean on you for, since I understand
we want to avoid too much KVM/virt special casing for VFIO/IOMMUFD. I was
thinking that if I bit the bullet and implemented nested support than when
nesting was selected it would be apparent we're in virt context. However,
I was hoping to pull together a solution that works with current QEMU and
VFIO too.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
