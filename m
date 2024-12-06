Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CEBE77173
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRfQiiDj1mkLesjonWumn4/Ta3UZwtLqVZ6GngdMM/8=; b=L0118HbfDeEo2C
	vKyNeIkzTkdEXUg1+ILH8IRMrPsge2WRnD8aQr4ZRpfrO/zVIZrijh+HjVbBeBQaZkhLDTvUntQ8B
	73Zqs4FD/3MKu+l3RQ8Fz80VqdgBekWRxV8PsIetmXjR5rpFbVSjAZnCyOEiRR4Syzf4/EN1CY3iv
	GwoGjxVS6ZPPI8OB4ZY5eYhbN9UgDZk2j7GTx+1OHbXQcebFPffNSEE7L39vLJeKSH0hxyBLj+6fh
	TqJmcDxTk57/jWz584XI8/tisZx5MB+fvBZa79WyGodwHNbo8mykOs7D/YDd8iZ0Lun4/eO1QwtwC
	44Zx8lDYERR7D4HWeCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbWR-00000002EgT-3D4V;
	Fri, 06 Dec 2024 16:49:43 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbWO-00000002Ef6-2CM0
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 16:49:41 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-84197b4e61aso149425939f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Dec 2024 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733503779; x=1734108579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0whfwYAjXy7+XSzVEU4KqWN95vXE9XVqm2dCOOqkrKo=;
        b=J/4IwfBMBGIPyzD4k0GKc0uz7/WnfFq2/EM8gHo82Z7a7kpPfug/X3jOKKfhGhe2a3
         PvjyZVFqn9kRfRmBibVbO8N7m1DZUTexaEFM6tz91iObMeFa++Dq4jji+s8dwst9JVOB
         ftAX2hNV4IJpBMC0ErHu9ehtmZ1IPNQiBhNNdO2GYpyx7wwrwCbKn9hczF8xeN684wqA
         Bn8wprtV55VEOPGQRzsSEoCTtcco1371lQ0koIMaphM0j1smNlksPXNCyq1nObCDnyCM
         qGvlNYI8lsjsmcmr99ijswCI1WYjc7zpPdK1APKFIMB0lsfgxvqacznEtkHqoFwN3ko1
         LfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733503779; x=1734108579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0whfwYAjXy7+XSzVEU4KqWN95vXE9XVqm2dCOOqkrKo=;
        b=uk726ShmQzYOtcFZBcADNft12XX/TqHnsIlkZVI3AFSCGFSTnfv3FLf9Odmq3Dzefn
         wg4yh4UORbJa3VwfXPBo2YlLpDYKX7d2VBp22d5AEbvrnxTQirUjQ5rPjPTzDG6cluFU
         DCP8FYLWQFxiqYbbrhcxhFLIptXFgZfwkA8AiKrfXWiFEFC0QUAynPGLEKYqLbzspmnl
         qgbXM+oWXkbfYolXvGSfpwW9rxLqI8SyOG5X3yZMsaL3xX51BwMDV3pfxeuQxCkaFbkc
         pqLGfaafL1NuR/La8LKFgyoMd3Jp4PQaMmf7SIUVKtaa7r49AKoR9Ij4V1NDgJnBcR93
         U/oA==
X-Forwarded-Encrypted: i=1; AJvYcCUNbLZeQiRfSRb2ZbypYCV99PPqp+5hsZFi3CnG89yqCMSLCprg6v1lKSV+oRkEk+r0TJistKwu8eI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwV+q3mt8i0B1FOYm17jzGGsiM/GAYOXy5yLM+3OoccvLL6S+kX
	WcPZkoLYWJqnOzyOB8kN2gorU6h8vnxNc7znooQ9KSvScroYo3ngOUrvrJv8UOgwDqcswE3e6gP
	3zzOOQsyJY3jdT69R2WEKABMCxJKqj+tL8CvQjw==
X-Gm-Gg: ASbGncv9FD7IEw8oJh7SHby1JDwphfFlaa+4G0a0uQOqEY6duzpKAasqmwBiYxvbOzc
	IIZTfUicBSW3H0Io5CE4Ow789AxTMpKkoAA==
X-Google-Smtp-Source: AGHT+IFictbKsSbt5zxu6TMdxKpWJ7OEgN4bWq0xyn6ACDGGevBPbhVQcoL5/hHQE8JqD9YBvLYTDq/LyRqS/ACQ6QU=
X-Received: by 2002:a05:6602:2c92:b0:841:984b:47d2 with SMTP id
 ca18e2360f4ac-8447e34907cmr474724839f.14.1733503779122; Fri, 06 Dec 2024
 08:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20241127041840.419940-1-michaelneuling@tenstorrent.com>
In-Reply-To: <20241127041840.419940-1-michaelneuling@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Dec 2024 22:19:28 +0530
Message-ID: <CAAhSdy19qxSeTH4oZz-nggszew81bFz-Ey=HxcxtfxFw=4otAA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
To: Michael Neuling <michaelneuling@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	palmer@dabbelt.com, mikey@neuling.org, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_084940_811048_BEA0B1E7 
X-CRM114-Status: GOOD (  14.73  )
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

T24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgOTo0OeKAr0FNIE1pY2hhZWwgTmV1bGluZwo8bWljaGFl
bG5ldWxpbmdAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFRoaXMgZG9lc24ndCBjYXVzZSBh
IHByb2JsZW0gY3VycmVudGx5IGFzIEhWSUVOIGlzbid0IHVzZWQgZWxzZXdoZXJlCj4geWV0LiBG
b3VuZCBieSBpbnNwZWN0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBOZXVsaW5nIDxt
aWNoYWVsbmV1bGluZ0B0ZW5zdG9ycmVudC5jb20+Cj4gRml4ZXM6IDE2YjBiZGU5YTM3YyAoIlJJ
U0MtVjogS1ZNOiBBZGQgcGVyZiBzYW1wbGluZyBzdXBwb3J0IGZvciBndWVzdHMiKQo+IFJldmll
d2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCBmb3IgNi4xMy1yY1ggZml4
ZXMKClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gdjI6Cj4gICBBZGRlZCBGaXhlcyB0YWcKPiAgIEFk
ZGVkIFJldmlld3MKPiAgIE5vIGNvZGUgY2hhbmdlCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2Fp
YS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYS5jCj4gaW5kZXggMjk2N2QzMDVjNC4uOWYzYjUyNzU5NiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gQEAgLTU1Miw3
ICs1NTIsNyBAQCB2b2lkIGt2bV9yaXNjdl9haWFfZW5hYmxlKHZvaWQpCj4gICAgICAgICBjc3Jf
c2V0KENTUl9ISUUsIEJJVChJUlFfU19HRVhUKSk7Cj4gICAgICAgICAvKiBFbmFibGUgSVJRIGZp
bHRlcmluZyBmb3Igb3ZlcmZsb3cgaW50ZXJydXB0IG9ubHkgaWYgc3Njb2ZwbWYgaXMgcHJlc2Vu
dCAqLwo+ICAgICAgICAgaWYgKF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwg
UklTQ1ZfSVNBX0VYVF9TU0NPRlBNRikpCj4gLSAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1Jf
SFZJRU4sIEJJVChJUlFfUE1VX09WRikpOwo+ICsgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9I
VklFTiwgQklUKElSUV9QTVVfT1ZGKSk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9yaXNjdl9haWFfZGlz
YWJsZSh2b2lkKQo+IC0tCj4gMi4zNC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
