Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88821F3ED4C
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaNAEWC92wFOGRX4PqEZKZD+uiycqjSZHb/G8W82OzM=; b=Lgb3uM5c6RLb9+
	6zSi9ss71endG7lsSBwsHK1vtNsUOKIB38nvyFuYXWIxBLinbTOJF32dOJn+D9Gj8qxFkOwd6vjGq
	aXpxkU6oeHvVbLf6eii2U7c99DQVSUHe2OZDFEQbvWrQGB9xLFAYhGGf7KMA7WuFhd0soTnZXBh6p
	DlIqlVzXGYk5q1led0xmk119KM/AaanXoRL/+Y0AMgLQLAQEFbrzBEnYHqh7Q0OsR9cu3503/Gun9
	2+Eep5phrXLNPGqwD0D/ufERZnGX14isqIPUBPdlgeW5nhkgSbDwFNl4bekTbTD1YuVCEGBWt0fDs
	SICvoEHoZ9g4qZM3kmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXkB-0000000DRFX-0CUB;
	Sat, 11 Apr 2026 12:47:23 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXk9-0000000DREw-18zY
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 12:47:22 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8cfdac74050so307162385a.3
        for <kvm-riscv@lists.infradead.org>; Sat, 11 Apr 2026 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775911639; x=1776516439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWppL+WJopnByItX0KjB3DQR4+wR3fIbz3ulvVygolU=;
        b=DAl6t+VQpNyHFzQ8RNQ1PyZgv81F4JPpIscqEnUHOyV40+eMRkNN8Ff27/QWefZTNc
         dkz37uDQVlMi1qv89fRnBIXqxmqKhgMlAFxPA6rcnWwgemN3T1iBAA8wyk7rhY8ChI0S
         X3P05vTJEbkYvd9gPkCl9LmbAOWdCeu86F0CXsREYGFaPTkIl8XD4cn0zWu1zmi59Z7L
         62hq4al8uQiuZx4LxlrxBfGQgjep6qYtk3Q+2/naWnTMPECKYfVkjdJQ1oXisDeakw+k
         QUZ54NuEAjxaC3MJ84u5YArWozAyl2l234wcDXSdgw4Wure1idq7aE5cVa0WdRUFtCC5
         ykqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911639; x=1776516439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWppL+WJopnByItX0KjB3DQR4+wR3fIbz3ulvVygolU=;
        b=GloZgpZ+k17m5bUbuNXX5kg0VItd8bMgT+aPCdX3Yf4rCLHdEdBaEobajShYSJWpUi
         ZM/0qDviCYMwXlTeCgWnrEoXLTsJRUUuqmsgEUWIVAAIt6NOKmo7vMgbQ9FVdWYGAbTE
         s8W0uuTVC+yNXJjF0ZnY/FwnUwBphA3Vtx59BQJRRXlaucUCgZ1E9a7EFGUSqJW3USA5
         5WDIw9Y5M0OLZrZ969Tx+J+Rs8zCPI+rCTXuJVpyD+4B8JeL6wxPRqeT2Jlwrme79WPH
         GEbYf+k+Tu16bZr5JyRAfrKT5T/QjItX7xb8nUK56Yrc+EWPcK+9yFep3iveNwtTa7AR
         eBVw==
X-Forwarded-Encrypted: i=1; AJvYcCWtIiRj2iIc9MaLbxvBRaRyE8+8OMagyV5gNJ+6ErN+fdRGpIySO0DivqyraHhzDlCOW0JTvVLsDx0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyG9P4udW3Wof3vrzjIs+AHmJ8H8WK7En4rhTxDbffSL8oic/r9
	0ySez2PWSbXcKhNsPd1TgLPlPeVinAJXyvjgby2KVCMoS8o71Xiw3l913RSCNJ0q1Ck=
X-Gm-Gg: AeBDievwsheOzyYoC/QpPuf3IhNzhSED5+wYi8PMoFyJsfqT6+n4ekMh3mlmwHTaaew
	xH/1AjwghS3a4f/4F6SnhdX1kg9HrOV533/VGIA/lr3Oagbidp2UKRG2FLFoleAZNIoqz9JhgA1
	R8B9gwQ9/rZQAOzjOZwqI5FeT8e6TAX2tP9PjISDgejNrkV1OeD9KRqiOiY8lZkCbGyst4tpYBc
	lCtwRAkTGU9Z7+yWXrx+R0FO+TXb9XZ6d1Qo5eh8jdjAe1G8LC/sC5KsdaERkB2HGMizqtY5WXZ
	1gOlrLET7dYFOK8ea4mrA7RBBgZM4NWYcWLny8WW2d/TIxW0Rz9ZIZMUZqNJcC7N8nGQ+4D68/q
	Dncx6uD2qU5492uB/B7/afeLgU18CrsmhA4gD+bpuL1DWaR4I5jkhrTX8/LFiD2wJFIk8Slewnl
	2nIZehLCUaG3AqVgcNfTp3KygN4zPOpU/ltziGAbrVsH3KWWrLhykAhe1u19UpoE53hHmDRUFM7
	fIomw==
X-Received: by 2002:a05:620a:4155:b0:8cd:923a:87a0 with SMTP id af79cd13be357-8ddcd6fcfc0mr1003943885a.21.1775911639328;
        Sat, 11 Apr 2026 05:47:19 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb5f89d88sm426412085a.4.2026.04.11.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:47:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wBXk5-00000002Xff-27WZ;
	Sat, 11 Apr 2026 09:47:17 -0300
Date: Sat, 11 Apr 2026 09:47:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org,
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic
 page table
Message-ID: <20260411124717.GE3694781@ziepe.ca>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_054721_504374_4F6EB0A9 
X-CRM114-Status: UNSURE (   8.87  )
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

On Sat, Apr 11, 2026 at 10:22:22AM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> The RISC-V IOMMU can optionally support Svpbmt page-based memory types
> in its page table format. When present,the generic page table code can
> use this capability to encode memory attributes (e.g. MMIO vs normal
> memory) in PTEs.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c       | 2 ++
>  include/linux/generic_pt/common.h | 1 +
>  2 files changed, 3 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
