Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA52FF885A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCHeNQrkQteFxSmEpztmFlC602IbiIjYna5bvqeJegw=; b=k+77bo4na2ci7e
	WjM1kwUzUqfMeH1JfGthYQbZoa3HlgN+2v7eDLbYp428qYow2xhlYoFLkeJ2v/PD6bVwpZq3wdTvO
	2TIJtqZ9LtA5ya6CCG4LkXkWFFOhBsoXjguDts0BVHLLGdEuVg/0FshSJ3kl/B7kT07aq0OErLi+u
	YfH1EWhF8Ifkak1XTXyvFVpOoeziENcSixDoG1NdJkjDzR4g/LU3CY9lJXGIMWbvJDQRSRMZjzJ43
	ecBCa9ISFBmf9kaSgfEr4QKmAfZzxUA+3igDv98XGEo1ra+/YEFnzQaa+R5K3OBQe4QUZI9mDHuhO
	Gj6rAHLoqZqKH1rUOD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHifF-00000001ZJh-1qj9;
	Tue, 28 Apr 2026 13:39:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHifE-00000001ZJ6-0Um1
	for kvm-riscv@bombadil.infradead.org;
	Tue, 28 Apr 2026 13:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cP40XfCNqjUZHKaFHTD5m2R9L06qogZbeISGyPC9spA=; b=JTVs13kKraWie4i0Mb2LLGmPDd
	EvjEtSwvQGgPQ0AM6x7mTpx/IQtgf5xAse5z1GaE5YIuCiKFl/KGIPTRa01BWZy5mz26BeE4tdAXV
	7gpVYy4FCvtz4mPa+LFMVep1MX7a1TYRH4C9Kw59T9yTYbWFk7OzD+3jNiMCMDPjE6mZPRZFU5iOo
	h02m5Js4fEQL8Gqx2zL+ntbufayxZKQtWAkaqaRFepoeU08wTfPTh36POk/V9Urvr8Gd2X0f9XqiQ
	6QfZcM/BPygVMcqx4SP/cMITNDSpsV9qP7K7lBgw/zLCG0PgBGubDNfQHIeWmyhMNZMczT+8jOMp8
	1IVE3qbQ==;
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHifB-00000003CUN-1LOs
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:39:47 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8a4b8c3a30bso129768596d6.3
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383583; x=1777988383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cP40XfCNqjUZHKaFHTD5m2R9L06qogZbeISGyPC9spA=;
        b=jUYmHBTX2Zi1DDWGR+8xa4HxqXwSoSRe6/niZWMIvn73Rs6/A1+W3gX2v9cgMu4vih
         JdP5AMR0pxMVLg58DNRTWmcWo3Ok8xLx6XLUAskr+PKWiJqR+oSwTx4CBpHUKw9qCe/1
         ctN4gPj44NZvO4gJc0k5YTHM2S5PiCESRIMd0E33k+o/MP18hS4G5ZwKRqfsfLBIvBCh
         1x9FFbCHQGjlk+w8yBZd4EuGvalMj2u+ikbPYaSv++ZlJe9bgsyGHk7dMw4Smrb7Cbmj
         jhSHO8/IwTR6boyBWTyPlu34caghE4HT3Ks+UGYZiwEodyrjmo7f4nSA4DjNjTZWi53k
         qkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383583; x=1777988383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cP40XfCNqjUZHKaFHTD5m2R9L06qogZbeISGyPC9spA=;
        b=Z1uPuSJ3cOEwNV09USSS06qrq8fZFl47TRwyAVe/41tshdXJit1ZtzH0KKhLKE4U+C
         z4DkkgTuP7m57FWFfws1yGXxekp0eLuMuxZShJ4/BjVStP3av7ZPVujfcdvmQJ76CS4F
         jNPml1kFTdm9ApzZZXeRyGN3656BCwBrZyHeLDTjolXy0fjxEV4+okhwyM/tIAz+D8O5
         D41Ge0r2pi8MghJytzyH34hBADArwMPBqo4g/F/eUtLwh396MD6CbkxNFhlrFl7ozrz2
         FrdAUR3ahj+vE+JSfzaq1s6SQJv9Gehp5raHPO9e1c9r5CtkOkBldgx7V4IGJb2Ws0JQ
         2ARw==
X-Forwarded-Encrypted: i=1; AFNElJ+hMSzpgKmjC47grbj1I7wmfxSQrThGcMQRm1kdUc9XWmyu/xF90SiG/0hLleja1lQ/rSx3wguPh/I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyawC89Mdz70tRdlH86Tv7d6X2tPV18ky03Cv0Dlq+H4j3IdxSQ
	zF3p2cst83dYx9KrMjKpoeL9pxRMtqaSExWZTVCIEO08vTsZvdpe41wZgVNYXR7wE5k=
X-Gm-Gg: AeBDiestGbQ3JobA9qpvRio1ik6kyjzDuHRyl8JIHl/AhnI5N+RnehpQXXj/l2M1D5F
	GRTgzP4VwvrGklLoknmGK+Km5bVTiakwXdK59pxExD7pPh62oa9S8HyJ6hUnZZ9Ng8/x5syYYy5
	m+4L25bsAoVgbsVzE3o3bYMX6pwy+/sP+tKYo+jFRElnu87iOmwk8u5l6aDXAtZPiu49vpka8Rz
	YBtVRAkHZC/8tkAjULAihKX9WDpTJiWqiASZvSSikOl7btAzYiocb1n3I3JOZhOcO6HO1GflbKs
	svlQC5CZD0O6+zng9zHW6m2BAjIi8ITb0nO28SdUKxfcbWZ+eO2IOhPNZzVgqAEtv6wHCFfUq41
	rmfd/hDGvjHEuAZyADweckfLQ0HFso09LDATNCQUmjp2lxwmSoEoAfSpQAGgNTUGDC1YO4hOjJ4
	J4hQqz2XEFNrX6ammZXiwwXCevvEO84X4qs2qpgGIGQCecu8c8iZrQRkczx84VENy0JsCr92KDP
	IAX9okkUf0aNbL3
X-Received: by 2002:ad4:594d:0:b0:8ae:7146:603d with SMTP id 6a1803df08f44-8b3e2ffa2b5mr47731266d6.13.1777383583207;
        Tue, 28 Apr 2026 06:39:43 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e281bd11sm20759256d6.8.2026.04.28.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:39:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHif8-0000000AjUG-0wGD;
	Tue, 28 Apr 2026 10:39:42 -0300
Date: Tue, 28 Apr 2026 10:39:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Zong Li <zong.li@sifive.com>
Subject: Re: [RFC PATCH 11/11] iommu/riscv: support nested iommu for getting
 iommu hardware information
Message-ID: <20260428133942.GI849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-12-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-12-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_143945_468315_3E476B07 
X-CRM114-Status: GOOD (  10.96  )
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

On Tue, Apr 28, 2026 at 09:13:59PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Zong Li <zong.li@sifive.com>
> 
> This patch implements .hw_info operation and the related data
> structures for passing the IOMMU hardware capabilities for iommufd.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c  | 19 +++++++++++++++++++
>  include/uapi/linux/iommufd.h | 18 ++++++++++++++++++
>  2 files changed, 37 insertions(+)

This has nothing to do with dirty tracking. It should go with a series
introducing viommu.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
