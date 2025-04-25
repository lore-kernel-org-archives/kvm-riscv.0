Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6656C369C2
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jtH4KgpZ8rIVCpOAugH/+nkA7hnAu/sP3Lmjh5VdtM=; b=CnnQLDguTZeGop
	aNhTXBhpByjh6iMYhelKM03G8fFlJfJjViZACAGe2mCqipCnybT0DnTDw1jdZiZpsDt+HFX7X8gJ8
	IZSK6Qgf6WQqj7IE8lG01gUN+9CH8HZx91q7bbEjiFSs/lJC0SW329YXWru1IZ9Y8J1rsttnUrQJy
	4c69JmjPzad5iY2dVaaAUt3iLxdD4jlYecsoGX9VWnGPKGs2ub3YNWrpPijLs9rfmF/OZHLi0TVQC
	U7aVDJKr90v5Vs2Gn9gX+KFIlGOGzT8bC6Mc9VfVNS99mJ37qj4zGhj9O5/i0/i9otsUKQr6AxV6e
	wJhzvTAIztsAPnYbr9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KBH-0000000HSjC-2Jhc;
	Fri, 25 Apr 2025 14:37:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ibi-0000000HCBX-2e3w
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:56:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so16417605e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745585801; x=1746190601; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jnvk1TG+dC2zLHnzaIEEd7gpPfBIDKi94FxYK6yvPdY=;
        b=exjSBJuZHHW8S2I/3j9mRH7f48W7VnAQ9ip1yJvpyG9x6nfKUBov13CyWcropz92fH
         X9e+jJzMGiybWiWcS5qGLCXd4gm4zMVfy+wPO0Gonj9RtihzAUzZfz6pJAA7mkRuAaZI
         /cnSrHSLBhf/Y4zEhE5ogYeKPcOYwqIv3tw4zsVHArLZJJuJZAxRxLEkMLJKH9UxcBrk
         wlVzbyMTrQfsbVKJWZW98OGBcmrkye5wU3EYFApEpKONv3gjF36aTFSoIUtq1lKEOqWM
         dnjftzX+u6qOx4RmzG5kkDS554vvQ1g+MYlm3YBiGKzzZXnBdmG1hoQqM3Qe85bGVkT/
         hNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585801; x=1746190601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnvk1TG+dC2zLHnzaIEEd7gpPfBIDKi94FxYK6yvPdY=;
        b=pDrT36QRYd4d/KmnvDMtIq11XVAtytcMZsdkROQDtx/a1kG4oYUv4dpgA0Twyf/zTE
         wmcCM2f5Yr1HhNG4fRXQ+5pz7td8AFb9RH4cHd8z+0ZyoIVH3T4/a26l1wEKu+X6hkgj
         gNQE9UbKzhsgmx8BDghlAFKn/r4LYoBJ5Z9wybvhIKEX/wx0cQrs8Rt80uwyXrO0PCJ2
         RniGDj7fKXRZUUwSCeqAygq0AilNzNEsJj5Meea0n8Ajzxc+ib/NlQrV4FjnpYVZGTNs
         TaDfb/T8G5/0sCIxoBRS1AcFcxb6W0s/K5aC/Jy8U0INTGdG45XLpp95l0BAzWBQMoq3
         /Kuw==
X-Gm-Message-State: AOJu0Yxto2pGmAjUFcYOXfP/7HKhKYHqbsSp1APVrx0zxAThtgSXwEfF
	gDKwZv8fMzJ7eQ7h/f206EfFOcJBX+pNq+EhmdD1dz3F5H/c8Htm1SAVBXCRibU=
X-Gm-Gg: ASbGncsA0q0zaLSM8O7RyhssW0FSNiSM+NTuOhg0fC58Rg19bo4BJLmew6cLkO2ksb9
	z66zi0ujXUN2AAbXU/KljF+fwRoNg0rxbPpm8JM2ghCAkWeYyQHW2MkjyI+NEtMzehbyAbea5Ou
	r+n4sdTfMes4ictEwPmM1QVq3YYtdJBs+rZtvfkfeOgv459vLBwrYI3rWLhsPqhujeTWHpe7KMU
	8iPRXo76HL73mwxkxw4wYnMRG0Ge2/UAsdqya33uuxnBuiaRsaRBqlB13wBUCtrcvtQ2D1Ec7x9
	cC48PnY8mxJWrIPSoAZWQZN3Url2KfrJk5UjIiw=
X-Google-Smtp-Source: AGHT+IFmUXNw7ABwk1AMQuio7wlOtcBFgvt+8iHk6nXh+9b35mkhblHJxA2ykHiHusAsYgEzWN0GCQ==
X-Received: by 2002:a05:600c:1c1a:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-440a66aca3fmr17281115e9.29.1745585800956;
        Fri, 25 Apr 2025 05:56:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2aab65sm55907865e9.17.2025.04.25.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:56:39 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:56:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH 1/5] KVM: RISC-V: refactor vector state reset
Message-ID: <20250425-657823a94b7228b742cbe122@orel>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055642_666325_6AB7EC0D 
X-CRM114-Status: GOOD (  11.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6MjU6MjBQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IERvIG5vdCBkZXBlbmQgb24gdGhlIHJlc2V0IHN0cnVjdHVyZXMuCj4gCj4gdmVj
dG9yLmRhdGFwIGlzIGEga2VybmVsIG1lbW9yeSBwb2ludGVyIHRoYXQgbmVlZHMgdG8gYmUgcHJl
c2VydmVkIGFzIGl0Cj4gaXMgbm90IGEgcGFydCBvZiB0aGUgZ3Vlc3QgdmVjdG9yIGRhdGEuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmggfCAg
NiArKy0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICB8ICA1
ICsrKystCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgICAgICAgICAgICAgfCAxMyAr
KysrKysrLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4KClJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
