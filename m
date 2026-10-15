Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254E9CC6B38
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 23:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f+sN3N4SX6MGkNdN/doGYNNoUSDo5k0j+maSOqBL74=; b=M7KtkMBjt+d9H1
	7r/J1Ojzihb1x+gUhrHhnIDkVcd9lGHj3PQTHAYwxtw4jXQpHTQBxPleLwdOLgRgwXtBkiccgorYq
	SBJxHu37CT7lASNG+6PmgzOEvbpBGBrHGZPZqXzVEuFIoBS/vGEbNtguWg/Y2AxbmP6Tyw9PZNq/t
	VqFZ209TLWsfFqIrM77ZT7jubOUpSdIa4w4N5ySycVz36tXK3iEBotyxh/4GHgAtTba2S2A3+Ps/M
	4khQrIIpPuCeGXdgfD+S9P6oEJ3gZHOqp+j5yuX66TXYJrFknbS8cUppRMPQtgSkFd9yuFp06SDnb
	t4Vxq5qcFYn9iZspjIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVGv-00000001a6E-2Qss;
	Thu, 15 Oct 2026 23:54:05 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVGt-00000001a5U-2Sl3
	for kvm-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 23:54:05 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93cbc3ab2fdso107296185a.3
        for <kvm-riscv@lists.infradead.org>; Thu, 15 Oct 2026 16:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108442; x=1792713242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmHIZZgl56SndGmE7ZHoozI3Bjh3H3Lm9ikaXzIGcaI=;
        b=NUltgBMbsXwX6Gk8bBUD9e+U2pYnpBTqAzaIZOzFV5n6poHrCqfLJx7feDZU95btqD
         XiSmMsMnc16aZTDWIbfroMMm+zkqdpjytMTupx75T70ZbFI9/4V8t0rNGBQO00qB/OWa
         R8seOjEQsx53IBycoDEQOklRBsv/1DWi81Om0VqS0/ZbLuTFhMknmsH6NR28ezb/WvPt
         Xt4olc43FkJevGmbddW/xN/7eXIp3TW22AgkIk9Jl2vDHd/XdoK6fpyYtg4Iw0Up2VkY
         7kGd4ZVn5TPSF5fp4IIlzkHJontpVh555iCQQRsV/CXqCn8M4l7SvBmIeh0549lqRB/u
         DNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108442; x=1792713242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmHIZZgl56SndGmE7ZHoozI3Bjh3H3Lm9ikaXzIGcaI=;
        b=ysCqWHYUarQCYJfyqpigV+Hv5NXvUWNrue4R2N026OLmqmVd9L439++2Zcuo2VlW2t
         hsGj7ZoGlK8nRwmMkO7QCylEg9flwX4eQIvc0aeS/7cD2cqP40bV7TVTnQBf++5V8yEM
         eKbv3oDAUJSz9hmSY4AS0ewzSsHoCKALIu8RMSBkCS4FgxOpEpmjk2lodZJzBT1RAFi6
         o4jLzqigLHC6deVJlLVOlB1RC5XCAQiZWI8MjcpmSqMS38mPHewU/tysAfa5nw3WRlc0
         m2rMYHDjpnqks5wr98g+6qMoOge6YqkG7d8URetQf2l1WQU4BKv2FHR5dRbY5Ts0W10q
         GdXA==
X-Forwarded-Encrypted: i=1; AKwUvBxKlFYS98SExXW9qzRnKhEUdX15YqZ+ux99cuCq1wtyVtHVjS42N+mKjb6iJRALfnEzIhi4hZsbmNs=@lists.infradead.org
X-Gm-Message-State: AFq9FYL85USzcvRtEYVVqZOUQaRwnCMhsLuK+xeac39T+F9welWnEkZi
	2ula7bPOWYiOWT41X4qRc0wWT8TruWnUlCRBF/gEJuM57kYY1fZatRgY/ynI3yTBt4U=
X-Gm-Gg: AYBFou0C8CzSP71Efh7HLLDZYfa67llRoWXz0bl4IqUA7QqAeKtUu5i1J84FJML8SZK
	l4Z5Mk2Xe11hSFJbTcYkQdBya7UqV/l1Ul5LqxStNzgN9YzZ3mfkji+VE/7rPkk7zusevbrdi9w
	TAOapprsbYkR1wPIDL5iwp1Y6iAVedIyVwmGHOzHo1ChgM3aBOGTJNnl6rluDilUoU/veheRZEy
	CcDE9wKoDzTMa5jtZOICMWqaZz/MJ6+D6vSPqrIJrjSs+3cLkgV15XcRzl+k1nLqTRteSzNnVEq
	IaZ6QF+XIdKS4TnfL6HBOxV6vRgxHlA6s0RhzV38tM6ieHiRSm/HjaQCS1wWWrOuvj+RnLpiIKo
	ukCllNsqFIJqCRK2ajhF77p6+s6es9XpaRbtf4BPQe1bHvQsz3UGuLWABEEB9a33NcUV8mF1u/c
	Q1bW5dvTP+xp+REB1N5KxZxdTMwp6wwcZaSmkanOUtawtpmA87tui/NVDhNL5Di70wqY7HJ1wPA
	jPM6/Pgd5Gw4EGUvOpeTpH+bL1FeYlj30Zf8qajtFQeSjoG57EbEkyG2HVgCIqfs/4=
X-Received: by 2002:a05:620a:6086:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93ebd24cda0mr3455302785a.45.1792108442214;
        Thu, 15 Oct 2026 16:54:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a19bb32sm62233685a.33.2026.10.15.16.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:54:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVGq-00000000GRr-1dQk;
	Thu, 15 Oct 2026 20:54:00 -0300
Date: Thu, 15 Oct 2026 20:54:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Zhao Qingye <zhao.qingye@sanechips.com.cn>,
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [RFC PATCH 02/12] iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
Message-ID: <20261015235400.GZ14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
 <20261015065232.604503-3-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-3-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_165403_948962_538D6039 
X-CRM114-Status: UNSURE (   7.42  )
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

On Thu, Oct 15, 2026 at 02:52:22PM +0800, Gong Shuai wrote:

> +/**
> + * struct iommu_hwpt_riscv - RISC-V IOMMU stage-1 page table data
> + *			     (IOMMU_HWPT_DATA_RISCV_S1)
> + * @tc: Guest device context translation control
> + * @iosatp: Guest device context stage-1 root page table pointer
> + */
> +struct iommu_hwpt_riscv {
> +	__aligned_u64 tc;
> +	__aligned_u64 iosatp;
> +};

Like the others you need a spec reference explaining exactly what
these fields are.

Usually it should be the entire guest structure, is it only 16 bytes?

But this looks broadly right otherwise

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
