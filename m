Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7212C36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRQehXCuthxXDpAYzINDi1m/mYbJeqZM5OCuInJ7Fzc=; b=BVeRKrOV7cZWgx
	TzXXEOSMdMtqF7PHSxZMbHAkmKCEvBRUi+FZRZlAjmKE+grpiS/A3+50oxKYwSO3ic1Qza9SqewtB
	3Is1vxZwa1r+H00J17vkW1LFuYgaX3/eZHjVf+nJXV7t5LNBanMpK7AdhJE/XMIaEK146zEC1fih+
	y0dL8DCqbHpi+wCrJe51QKHmbUj74fb5W+R5wTn0rYy+VpqwZQyNG3shtveGNdVJcB2FXwoX+Ct9E
	R7E5L4Xpjd7qPxJY0s1h1X9j+nSAUIFLJIHGa5IzBVlRxR8bXqWr05izzrJQ6qyzkGfQwVEIv5piI
	tEqmB3WTu5LBMu0KcpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twk4b-00000003YVL-2i5V;
	Mon, 24 Mar 2025 15:50:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twk2J-00000003YGN-01JC
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 15:48:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso46127975e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742831301; x=1743436101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LrMEg2SBRPufHHPsPTxdKBRIozyqsnf+0fw9wrne1Kw=;
        b=hHYgcAoY0MYdGz2+JGHQVprfrnzaiMWbv1CLrrhyZ8uSatU3Co4KOGuuMsTYj3IcQg
         4UsTAIzs4ZwReUGFkcMJgjRlwE8cyYCKXKRv3dKHoyvEway12YdPZbjuNv44hZlh7BWx
         Qr6uyi9WD0MG5ywH0DF8JJ8RCNQGi/RSYCqTlzt0W4jqkww2ih+znIPNpTmA9W5xLZDI
         RGm00MALhzLF3bdpeAQc9r0WNDrdJZNvBGrevilXdNyscp7JfeMWc0BzgcA7J1xqHhMk
         Gtfuru8pUM690z02tcYDV23YCvU0/GVtGP1ngNYeCp2NAP6b/Qlw0QTuAStlHMW7ruiv
         W49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831301; x=1743436101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrMEg2SBRPufHHPsPTxdKBRIozyqsnf+0fw9wrne1Kw=;
        b=Fr0IbdpiOmmimwicYWdju3ovVIDgw36ZpNvbbbRfVof7jxC+4S59RJJC119Vio7q51
         cPVXq57E/rmBFiH+fmkJT+kQSUmNEOku8mkYwb/84WA0/oovZtiQzmwbm3ZBJLlVmRBn
         GTk5KhOwlKw6g2ptlcBjjHtu4w+xtTxCbqZpEBdfBM5ojFI5whZRSxhYZX5yjDxe+zGk
         IN76FfhSHIwu8g21HZfYAapygJRybUAo6G8zfMuftQoOvULo7mbBGOQ1q68w84HSA6ca
         qtG9mKeJN16UOLtIO+tp4eVDoB2s/BU2NC8PWbjc1pw6HBqrjP7of1hudnKSShZd3M9D
         1I/A==
X-Forwarded-Encrypted: i=1; AJvYcCVgk0xEus5ca+z6tTuS2W0XjOyZRn4dd5W5ApsNSK+TkQpK8M9BkjPiYGRBwQ79ECntlhdRwhwQAaQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ4DoGL7eWJs21C3qQL40+ZpmxuyHtVMFQOty2q+e31bJn4QOn
	eQ0oqVMleI0RGevNPF2RfIfDNl7q707nk0FLOe3WZ6+ZNwON/sqpTk7jBRBSkyRWCzGDVPEsr5A
	SmlI=
X-Gm-Gg: ASbGnctxU1IQXycDNuSPwI+SCJMsyqvVg/UhJ28Lr2OI9Jick0r9bxHzT+Y8dPf1eyP
	yFIIMJ/XZAixSf0itiSEmsdawEHIQJKw1SnrBEPpAiroFGvfiB/ZGD27Z26iXw/z6CA0rz2URFJ
	tGQiPD3cBvtOrBcRBQdSAxyHE3wB7NAj6Jxd31pOkcsBrvw8DjJi4iNfPx1cgmmRmOxE/oxpRNi
	UXn+C6lmN83Q9mM9qAn0aJorNl28/H4k1sm+NURrXf7f9n+juwHJEH3aOR4vPsxKygS+FBcWIrH
	psbIKXsV2sYRtdrwM/ECiMVZZ8FcGAgFbpcs6C4nyODkGWgnfgi/oQ==
X-Google-Smtp-Source: AGHT+IF4HKRqDp7H68XcsGcdXR2R+pX/n70fM2CJTR1c8n9FwVMwhpldYszXcap+M+tGB315WPIqBA==
X-Received: by 2002:a05:600c:19d4:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-43d509e9eafmr116532925e9.9.1742831300985;
        Mon, 24 Mar 2025 08:48:20 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9e960sm123514055e9.29.2025.03.24.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:48:20 -0700 (PDT)
Date: Mon, 24 Mar 2025 15:48:19 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: andrew.jones@linux.dev, alexandru.elisei@arm.com,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 1/5] configure: arm64: Don't display
 'aarch64' as the default architecture
Message-ID: <20250324154819.GA1844993@myrica>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-3-jean-philippe@linaro.org>
 <1b0233dc-b303-4317-a65d-572cc3582b8a@redhat.com>
 <fcb7894d-51e5-4376-b32f-4cb9eb94b573@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcb7894d-51e5-4376-b32f-4cb9eb94b573@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_084823_041917_4FCF44A2 
X-CRM114-Status: GOOD (  22.01  )
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

On Mon, Mar 17, 2025 at 09:27:32AM +0100, Eric Auger wrote:
> 
> 
> On 3/17/25 9:19 AM, Eric Auger wrote:
> > Hi Jean-Philippe,
> > 
> > 
> > On 3/14/25 4:49 PM, Jean-Philippe Brucker wrote:
> >> From: Alexandru Elisei <alexandru.elisei@arm.com>
> >>
> >> --arch=aarch64, intentional or not, has been supported since the initial
> >> arm64 support, commit 39ac3f8494be ("arm64: initial drop"). However,
> >> "aarch64" does not show up in the list of supported architectures, but
> >> it's displayed as the default architecture if doing ./configure --help
> >> on an arm64 machine.
> >>
> >> Keep everything consistent and make sure that the default value for
> >> $arch is "arm64", but still allow --arch=aarch64, in case they are users
> > there
> >> that use this configuration for kvm-unit-tests.
> >>
> >> The help text for --arch changes from:
> >>
> >>    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
> >>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> >>
> >> to:
> >>
> >>     --arch=ARCH            architecture to compile for (arm64). ARCH can be one of:
> >>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> >>
> >> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> >> ---
> >>  configure | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/configure b/configure
> >> index 06532a89..dc3413fc 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -15,8 +15,9 @@ objdump=objdump
> >>  readelf=readelf
> >>  ar=ar
> >>  addr2line=addr2line
> >> -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> >> -host=$arch
> >> +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> >> +arch=$host
> >> +[ "$arch" = "aarch64" ] && arch="arm64"
> > Looks the same it done again below
> 
> Ignore this. This is done again after explicit arch setting :-/ Need
> another coffee
> 
> So looks good to me
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks for the review!

Jean

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
