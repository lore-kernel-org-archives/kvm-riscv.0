Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DF0CC6B38
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPLt1VrX2OzkZsdUs5SGwjpEM+2OUdbtb4Q5YLP4IYE=; b=LdCqePIdGBOMvx
	Q51IjaUES9uQhXjDbiUN1PdV/yDlq2eIeen91x0OQoJid+TEpJnyzAySf37ZYmzrLlGbx6cBz38Lf
	/aIeBA9fD5NxIsIYmEsO74wDwSwUGDjaBl6EzKOm12RU+TNdY2xleqgrF8T/Gsbcc/mjpRR7FT6ZM
	RTLOC2D+JYzwjmv/43VLJ2SMqz70TQ84fLlKGqYu3CY3fUy9Wc3i8rxLyKq886xM9wXdf/hwyCaMD
	Bg6WDuthxEta03A3vOTbDXe4t2K0Ygv8phq3fPMe3S3frKP7Pn7zztXwCW7L8lx9yIzVUdZuwSvNp
	rL1yjx97y7AMV1LzUdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHisQ-000000038aD-2NeR;
	Fri, 16 Oct 2026 14:25:42 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHisN-000000038Z2-1ep5
	for kvm-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 14:25:41 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-91791ec1b83so460176d6.1
        for <kvm-riscv@lists.infradead.org>; Fri, 16 Oct 2026 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792160738; x=1792765538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9B4QGdToSnYzAqwiubGkyqZ40Y9TYft35PK0Z/WSHI=;
        b=agKKXr7IWbEmGGhbfTyM6AeNiZ9FuHeKT+YF9Na/T+rbPZVTz+qibXDgBhPYPams+j
         ov597pH7U1eZz4pcwyaS0MofzGb9PcJXevxHn4HMFbjSf2o0kZfxhB11jN8ySbegc1KW
         2fx+izUcN0L1mNPZQMLLdXM84NjctvyHzR5qqYT1uOWUnJLNGbdziz1cVxqO6BrOW/4U
         ppHttzFX0RHTwXkv9l+sXdOnIl+YzWrJWRCGDx5IyS52G0jUc3pTwBsTAgTqXxDbfLAG
         Yh6XAOBWtmVHfEA161/0A+sdn8iXKCX4LkSunch/rDvsJlLD90J/I3mg/8gRYLEWLFVX
         3mEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160738; x=1792765538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9B4QGdToSnYzAqwiubGkyqZ40Y9TYft35PK0Z/WSHI=;
        b=mycK1nyeWg6USt93TPQ9x3J4/8svFNajEtqQneAYmQgqB2xRzV53n5TTjjfUoxYOxI
         vMHzI/QGGPXK7N+69qaNhPMAzjfnktEv5GBypFSUC7Cc6dVlrIVCVawnQ8TnnPcDrTc6
         MQI6B6/ahP4TpS3qnS4oPejmWBNQS0n1eLkMWHOb8QjOmaCdPvzsrhwhEc0FsrWwRIKG
         xgqbkpP6LXVBhREkU8tE+AzPUjzGleRX1s28fbZogqDIbDdI1UftD7heSng6JdyZCsAq
         PJfK9XhRmqdmw4eGwa0dIzKUhAEcK4g27MYgaFpZruZOoLK36faQi7J4iY69RDIYxXs+
         eFrA==
X-Forwarded-Encrypted: i=1; AKwUvBx6uQMNU16IGcM/UE3R7dpPNQaJp2HTx6YXlQD2yEobHOkYCkZvp//1BpCntEfvDHn7WF6UcLqxCDA=@lists.infradead.org
X-Gm-Message-State: AFq9FYKiqmArutLsWOYhf1KE+ZHh3VoqVso1gn/X/5vA5pK73G8xqvO4
	xYkSaHzcR6iFplQ8NQ9y3Mrf06n162loIxXfgHHgMWjgI7YOLo8c13hOoCLFilPcUKY=
X-Gm-Gg: AYBFou3ZRM4kYdfu77h03ccEyotI5fGK+0Vs0ItP8tQMysMTcdDbzfdyIjJGFP4bXsw
	pIi49eDZn6Ec5S4Uw3LPTyWlbHIo5vl7YfDSWyCofT39OWbw9O//bDnaDsapEpOGh4CyRddnFpS
	No+/1p/p02PZBGL3QbHFTTg6a4aSjC1UQPmQ3ausEeqrbJP/rJ7qLmN0zbfLxNFuMIab+lN6Xsy
	2rOe/yRxf63BnEIPOmG3EQV4re6xFHGcrtgvraZWKAkOo/Q3OuOT0pctPUnQ3aKUOxmK+sySWYW
	Ri14QVmadXIL+Wku53Zb96FcVWHAXSwjF15ZfGNJWrKAVRPBCF0KeFVLqzj72nks0OhYS1jXxye
	ePPGswDKaasbDkNrI74gtsJOQyn4LW/z22M/C3Tllt3ix7ddk5kIPhsXTiV7K4LMIhgTl7T/Jkl
	bqlneAM4U77fgWe4B/ZkvV7OSwuENSQkX/aW+ozJfMiP44nr+CUI+rE0foAAo8gTHHY1mlXt1Zi
	qnkuhBRzqmkZkWk8wkJ8p1EsYVffsu2p4MG0XEoVicXvSMYfWEMhHyX
X-Received: by 2002:a05:620a:3947:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93ebd24b2fcmr3934753985a.37.1792160737536;
        Fri, 16 Oct 2026 07:25:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba3e3a0sm23953506d6.9.2026.10.16.07.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:25:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHisJ-00000001pql-49O3;
	Fri, 16 Oct 2026 11:25:35 -0300
Date: Fri, 16 Oct 2026 11:25:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH 0/12] iommu/riscv: Add nested translation (vIOMMU)
 support
Message-ID: <20261016142535.GD14213@ziepe.ca>
References: <20261016000004.GB14213@ziepe.ca>
 <20261016091610.13912-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016091610.13912-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_072539_543618_C1B91037 
X-CRM114-Status: GOOD (  24.22  )
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

On Fri, Oct 16, 2026 at 05:16:10PM +0800, Gong Shuai wrote:
> Hi Jason,
> 
> Thanks for the review again.
> 
> > > Add nested translation support to the RISC-V IOMMU driver, so a KVM guest
> > > with its own vIOMMU can own the first stage of a device context while the
> > > host keeps the second stage, and add the interrupt support. This is an RFC
> > > and comments on the design are welcome.
> >
> > The iommufd parts looked reasonable to me
> >
> > I feel some mild skepticism about all the MSI parts, it would be good
> > to get more of the interrupt stuff actually landed before posting this
> > again.
> 
> Agreed on the MSI parts. They are a working proof to exercise the
> nested flow end to end, not a finished design. The reason they are
> in this series at all is that the NVMe device we use for testing
> depends on MSI interrupts. Without this support, DMA succeeds but
> the MSIs fault, so the driver ends up polling for completions after
> timeouts.
> 
> We will keep following the irqbypass groundwork as it evolves, and
> continue this work once it has landed.

It seems to me the riscv interrupt architecture is a terrible fit for
Linux, so I would prefer you keep that out of a viommu series and try
to address interrupt support in VFIO through the other series.

viommu shouldn't change anything about how interrupts work..

Without the msi stuff I think you could get this merged without a big
trouble.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
