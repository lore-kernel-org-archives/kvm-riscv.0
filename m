Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E26070784
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Y12ZdJI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mG4SCDnP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dkq7g2Gx21O+N7Qm52vh/dS18krpMY8jdMgAJgJDy3g=; b=4Y12ZdJIlODRONLVj64gTT8NQC
	7n7nafsyzK4QewQpwctIPOHrLOseXHOKXkVIOpS+J2ptJTlDjO9Qywubf3+gynPnq/oopH0+fc/Jx
	dSLB2PlABo+Noo76+7lnaT2shG3b0VjmFEcVV+d8qAIYQRlm4m7S5nuB4d/zL14Mrrgkfj/2Lrl54
	kobMJ1BRQKWrDD9Yu65RGZT1T+1ZpY3f9hJr3FF7VW2LcRuNP8EnXOe/g7bYUMKgaAQCSSxohYJWu
	2QI5dPErJntQw/VmL7O9a42NRQYmdnf/Lg/CmQ9tc66GyQiIzxESzq96/9d7u9uP1LRY8tFPfcqZI
	mkpSG+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlij-000000040og-1Plk;
	Tue, 10 Nov 2026 13:17:05 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlif-000000040k6-1TUb
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:17:02 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-93e55db58cfso173820585a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Nov 2026 05:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794316620; x=1794921420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4nJQhVDKToBC1JLFzd4gn3MfYBpNet9lByhTADIBpw=;
        b=mG4SCDnP7Upkwr32+kU+OHqIxzpbfd4zpom/Mm2KeQps0uvu9acivvuVajIB2zdx0H
         mr8YzhTb8137Q+DMFtRJYGxpoE0g1zXLgemEZtXG+yJn2AMhBznpNUDVh9GVuRYTwCF9
         x2gWubWT1nhcrcILNJANAacDhbo1ytGa+RLnAjSgm77zafkJXUhQXw3g9t/DLbqBbJEr
         YK2MIB1YmwRgGXZlL6UUQDfC3/YTMocl1nZKC/cAdZJj9uWfHxc+ZhqNoHlZhSgxTI3X
         4FnIJIStzbZtkVKo8opArcqFrNngfp1/wvJYxcFpCdm51UP1KSzrmYizFgohnIr4izw1
         dFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316620; x=1794921420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4nJQhVDKToBC1JLFzd4gn3MfYBpNet9lByhTADIBpw=;
        b=OU//ZMZH9p4EQ286xLIC8aEkfOagm2XuAY0irtrLGSPXuOoNTLcqNsJMcZa2v2BrsQ
         73tnO1MWOlgGZuQiIFKjY/jKoSDP6/V+R1qLrBM8oLA+8tKc/wFm/FT9BricWRu1Gr9R
         XkAkcliAnWcQKYZ/3sRs8ztdtrDSFnRKn5035k2sioRLlrvOB2T/Zmm5gLbHGJL1me8O
         dsJpI6srzpH9xkvUEb07kqN2pGKvNL5aeT/fSd776kU75lpPbn+bZmrXV/QMCa5UFJgQ
         wwQ9z2FfhpUXVLd1EAYH7clu7v5adwmb+CpEk9QZrRRpWRlJA2WZJ+py5TmoaaNVjd1/
         ttCg==
X-Forwarded-Encrypted: i=1; AL+hErFjYiWjSo08IibhDKsZUsnXt4i0FE9CO2fBE6FVhzWMynN3RTKuinZIJwzhM3MC2JlbITVEC01e4XA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+2iW42+Y2YD0erlSvWBfj31QHK96MsiJ5fHNPQauGhIVCXI4aD
	nFMrDaF0S8hYHrTsauFjFuS9SY64dzyBAeOlPmpTyYU4lVihKxOMCMbh8l1ti+38EMw=
X-Gm-Gg: AYBFou3a2FFjwN/8jywZFn8n4Ndv/OQcjFCbYHhJevjeBrHFLau6sBBxaF32GXB1f6V
	XqlvY1tsW6DclpBiF3KmmiykywrJqyx0Zkv2dktArV21hZPubEZ9A/0wfxtCC6IrPVHulsXIEOd
	G5dejC1DNkwoSuxVOJM027Pa+oWCJrxHKjX8ovBLp0JefGCp0tkBPZPX+LapjFSXQ3VBdS84mXk
	7DEkHr3b1kz9rIXjk2cAEGt71PlY4gw+Tpsnr+1yMwH5ci3ZVdt4xApBdmucqQ0F6/PTnYfRWfj
	ZYpB5ai8yFct9crVNzq9JQvS1sj8/WVhTXtCCrlTCQiFUREGaBDdIOVzuIpO3IYlY7UoPHFubH9
	Nb0/yjLaUeFUMcSJ+LH9u5jE/v2a45cEJRmkO1U+Jp/9WekVY+tpYzgiGePRFvut/OFjhCvBmfy
	QwCgNYy4BSxgMIEyDogkRBC+eycF90hHSSfnpRlAJX5Y66W6Z/qfWJmuaDCataBtTUGFWa1TiYR
	0+spUYTPGkzrwBOVLX3a+oIc/ABiIR2JPzf9eiu4r3RdwY9pRlKC+KpQQxn3YLYa2l7W71gJNgc
	jby71gaOGbnyAjeH45UmniXRxfaDzqLNM0c2nYW3q8tjYJ65vy6wLYjk9UD/LQLm65hXZet/tyO
	tlW/6Ck5orlc=
X-Received: by 2002:a05:620a:1724:b0:942:e4f7:6104 with SMTP id af79cd13be357-9479f3766f2mr439618585a.55.1794316619773;
        Tue, 10 Nov 2026 05:16:59 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61c333sm220869985a.3.2026.11.10.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQlic-00000005geL-2PDT;
	Tue, 10 Nov 2026 09:16:58 -0400
Date: Tue, 10 Nov 2026 09:16:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: tanchi25@mails.ucas.ac.cn, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Message-ID: <20261110131658.GW663069@ziepe.ca>
References: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
 <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051701_451789_8B5573F6 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 07:51:37PM +0800, Gong Shuai wrote:

>   2. Use the guest PSCID directly, but allocate a separate host GSCID for
>      each vIOMMU.

This is the right model. The viommu should allocate the GSCID directly
and keep it for the lifetime of the VM.

>   3. Share the GSCID and maintain a per-vIOMMU mapping from each guest
>      PSCID to a host-allocated PSCID.

AMD is doing this because they don't have something like a GSCID.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
