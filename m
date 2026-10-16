Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A36CCA46C
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2RtSq9M8PG8M8wtV8ybRecmp4ZVqJeDhQMHxX+8bK8=; b=uKO9UfYuHbBTWU
	HgQ+70kpn+B3/zrTUJZxAwwfZf04XEoe0JaY7cOHVB0voOi41NyX/vv2GGu2/kmGFOlDtfQhRlToN
	cQ03LsIxX7Lx5/2Is5qpntoCazDLWH8yz2w5fOs/EdNXmb0Vu0eWaGIU3HRJzL+8tg7xut3crY1ln
	6CXdTNpRZMmWtfo31HWMEVSM6BLfCMktpJv3fOsrHMBLkEKejeBeOOryDeBHCKh3HHyeUeC4ojsWU
	VFUv2TegZR5QHTrKOjk/Bg8AVWUajDjHgtTioFaBijdos0s8lJ1ztYiW+kvUblQkU3IL78xNCrS21
	5Vp0j8LYz9L6MlqaP8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjQV-00000003E8t-1mAH;
	Fri, 16 Oct 2026 15:00:55 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjQT-00000003E7v-1Fiy
	for kvm-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 15:00:54 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93e706a6ba9so3904985a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 16 Oct 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792162852; x=1792767652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAdHy+XfZaVWAHH+k3kEYHLQsWiJDDa9Am4rmLNBNPw=;
        b=iahrap8247jye3lY+WeYy/hvy1Wv8PDqjb6XI4vSw+QCXBhJPecVttjUf1W5/B+bzs
         c5ZtsDTLIg5qdoYg8dpbVsP/INs7CP20mNagLABZLiqGF2CWI4Ln4RC7v8iFUDYKKW1O
         ENgI/GbTwWfSd0iVTgvusYnvhLF661xU1uQ5fNkS+tc32hIQfjHdywjFeegX3xrOJioe
         gUjqsiH7kOaPrcXyqk41MqzDbui/TUy7vynHD4ccJw7A52iryq9nF1VF9ZkT1+N2LSNE
         cnvUDwpo2vOeqcEl8ikSDIDt2rM0qY/iJlnc6hqlH46vJuIZI/ArFJOxGyAFL9Gdy1ui
         H8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162852; x=1792767652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAdHy+XfZaVWAHH+k3kEYHLQsWiJDDa9Am4rmLNBNPw=;
        b=VxDLqFGaDWJGAO7Q5pD5Fshcz5okVlbxLusDUzdCjBj4hdJBLCvbMpJE7y0ckVGvtr
         lG25Et/1OvvRVm7XtZAN7WsFrUYwZ1DXboyxyd5GDVaZW6DFs3pWy9xV1kg7S4MjFe9x
         26kYSpUtZcu1sRDeNV+2WoFlaBEO/X9uqt8QnPHfgwSwROdFn7hfrE90/fUX0q7txv5R
         UrmP2C2oioHlmWESc5t31W+H64OoYZhE7DnT4gYBjrJhzmT5hvFawI4Pup2XtrfhgN8t
         qWptfMlYxU8vKXewB1/ueZno8DDQCD/k1niGfiKlb7TEzaq9mrOz0njggkm1EY8Ttr7S
         ZBmg==
X-Forwarded-Encrypted: i=1; AKwUvBwotB9826EQ/F5ILR0O3HFhHbR2kod6WXz2MATtRVx7rbi4hBmI355P6nxmJ0p0GuSJ4TN8vbuXaCM=@lists.infradead.org
X-Gm-Message-State: AFq9FYKCrC1pvZcEkRAlWGkBfz+EgwFqhuzHw7VxmRsZhbyfbXoCKrcu
	yNeNCqWQTrScWtBRk5NLHYeT/tsbPTHo4ble3Xu3s1JlT+zn1RXBR/XhfOs4nInnzKQ=
X-Gm-Gg: AYBFou22fJ5bzQdmBZnDXUeG93Z4oQW5fPJh7tL7u+HgqdSAC+8lYIzIMF+uJoIf2HN
	PfugeeW1woyBshH1SVdrJxvezfjR2BLz9JCKfPOkHQMlrRPOWX5V6WayQKWql3h9yVtoG+/x1m7
	Gw0F3zEWU53A1LgB1USo1wSzigrXzRvcyZf5szISsx6cR1qmQezjuxe6qQlau13CzE+SlTQoEB7
	0NLZFH58ShVDPjiJ+944T/K60Z/xlmdmmrwSIOowb7Zh4qiADRRfsPo7y1N1CpMyIouWAzKf4VK
	9mUwx8e7ZAXATszBAAMcoKrj6T8CxVZdhRcke6mrs3QIC3LxVSy0/DqI7AQ2VLrzBKNoChOtaF4
	xrlKaB0FEjm5uJTif2QbqgqN5eYahP1sMV604WedBO+KqBiFAUQ1xflRVsixHBdjhg+5CRNXF78
	857xzY+Bkm+yjsEBfo4dbXkbyaQEgaHK2JfKtzq4a0ExzzZlwrnt1gZe0BJkvSdAIXBasC7t3Ca
	/ksF8gAd7DolDfn4Bq0sx8O6zhK8DVGG+tANrz9Pl+jqDpfvDqKly1p
X-Received: by 2002:a05:620a:40c3:b0:93e:646c:9133 with SMTP id af79cd13be357-93f29da5d84mr10749685a.64.1792162851675;
        Fri, 16 Oct 2026 08:00:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0d0718sm232558985a.5.2026.10.16.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:00:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHjQP-00000001teG-31SO;
	Fri, 16 Oct 2026 12:00:49 -0300
Date: Fri, 16 Oct 2026 12:00:49 -0300
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
Subject: Re: [RFC PATCH 02/12] iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
Message-ID: <20261016150049.GG14213@ziepe.ca>
References: <20261015235400.GZ14213@ziepe.ca>
 <20261016073020.10119-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016073020.10119-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_080053_350327_E661E0DB 
X-CRM114-Status: GOOD (  12.38  )
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

On Fri, Oct 16, 2026 at 03:30:20PM +0800, Gong Shuai wrote:
> Hi Jason,
> 
> Thank you for your review.
> 
> > > +/**
> > > + * struct iommu_hwpt_riscv - RISC-V IOMMU stage-1 page table data
> > > + *			     (IOMMU_HWPT_DATA_RISCV_S1)
> > > + * @tc: Guest device context translation control
> > > + * @iosatp: Guest device context stage-1 root page table pointer
> > > + */
> > > +struct iommu_hwpt_riscv {
> > > +	__aligned_u64 tc;
> > > +	__aligned_u64 iosatp;
> > > +};
> >
> > Like the others you need a spec reference explaining exactly what
> > these fields are.
> 
> I'll add references to the device-context sections of the RISC-V IOMMU
> specification ("Leaf DDT entry", "Device-context fields", "Translation
> control (tc)", and "First-Stage context (fsc)"), and I'll also include
> detailed field information, as ARM does.
> 
> Also, I'll rename the field from iosatp to fsc. It holds iosatp when
> PDTV=0 and process-directory-table pointer (pdtp) when PDTV=1, and the
> two share the same layout, so the name should cover both interpretations
> and the uAPI won't need to change when Process-Directory-Table (PDT)
> support is added.

You might be better off just to have a data[] array of the device
context. I prefer the fields are not parsed out in userspace..

Future specs may add more guest controlled bits and in other places?

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
