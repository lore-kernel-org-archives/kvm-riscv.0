Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C214DC61DB2
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 04:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne24xVxvX9h1kOpgZzmkXO1YaOddg3oppUb7XppECIU=; b=b9OUrRffeN5rvK
	bqFLMBKXAF95RvzDg/WPtYXfYGKMBaHUtuQGY9JAmlNBzmxSyqvgOH3nPLpeqxpstCLpSDbNcMu//
	cdl8e8TyA4uKZJQFZIxxsdQhKXUzTbePd5uJ1Crf25IP439n+dJBW7wAWneH/CUpq007mUndxjEKd
	ioTus+hJ+IMGIgMhDFggq/pEhOXW9mlX77rCBtenfHNhwAth7wWsFfypvgD7bDhI+EHuEDNAkpdJv
	UMsK5xCQskvndQl+YRV9lCo4DXymrEpQtihj6BtvbQ49kGP22aDEKhGn4bz8UhSw1tu0JN2xEHQND
	YTwK2SBbY1bXMzUKHnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOULu-00000003QP8-1Hgn;
	Mon, 09 Jun 2025 04:43:18 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOULr-00000003QOK-2AVF
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 04:43:16 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-86cdb330b48so361700639f.0
        for <kvm-riscv@lists.infradead.org>; Sun, 08 Jun 2025 21:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749444194; x=1750048994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLPCYr5e6u6vsBLYdaChBsgJrVajuCmHnbhRzhd1SBo=;
        b=PKtV0OxLHxY4YVH3Ibyc772dI3ssejb8u/VaJpgNlvAEwbu84CK+7EMvkocKBVNi41
         Z9M3Z3hasWCno9X+agLpdeTjS2bPe/amvZfGaTKLtsQGBhm7T3BQCjtcHXDD+AXqt2HK
         wkLV/ffaDsD19FrIBpDghhcfw1EY8XKyXSn+vPO3v4JXUK1x3M9e/N3OWMwZ23bds05J
         xyBFmIIyeNbcauX/WoSiuvEksM0IiIfUrAw8TkFDKC5iIiNZgwf8C+Ze21+CtVZKQ6V8
         /Ocs0gCF/5whoDXLfgldVoN+Sbrc3SOtl6Gk89SHo2fcAkoOfYzWELK5Rht2Vuvowsnu
         Gizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749444194; x=1750048994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLPCYr5e6u6vsBLYdaChBsgJrVajuCmHnbhRzhd1SBo=;
        b=oUtFRc0nG9QKCWgbO5sxtQwswN+uFHEMDlVm10Ib5o2akkRLoX5D+/SMtMGg//psF2
         yXsgTCTvW5G8ex8bB6mjcZT3nSvY2Vl+Fz1DSxy4G66xvtQdDzY98syRtiFIWiX89939
         3seSG2hCzBbnRD/aMX6cE25+dWIEQc5/HTfAkKp8Q6gj30Ip2vv2DkYqkOb9OCxxR2g3
         uPFgwYjJ0+rJ2Rm18dzmX79KpZaI6fn4OD6ZQlhm3IFLVwTE14hklTUahWgQIYhaisIV
         c15xOD2pHmVKaL6jy1mdSkvlEaVhvK/TVFVi1UVIpwv1CVPNuv0KU/IA43vhhHCfYxc1
         ue3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7KaXNU+VhBCy2sRP6aAhUbi9MT9uI0UFFAcWfHo677YG+OgGWKHRn6m/hkfeQB6TfqwBUX5OSHjM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBupA4rmtcjCLnE6DOhspDT/smXtGbAN82kNYH5Nw3xYPac82d
	eVHEctssGdMGe5UyUlDM1OrwHbNE8z016MaktGjwm940GWlJ66trQc9MsqaA1AoYFAwZWw9uHUH
	zOm9YYS1+O0qXG1WSo4+j2En8CRL6AiAh7PUizVyUWA==
X-Gm-Gg: ASbGnctDTn9ibUWuHFAr4OvPX5cpJiMwbHBh+UQJlA12VS8nQOo5LaGAF99KTzDuLKV
	uVgmsh9e0bdgHtubyPsQybwaSHlWf3dfcvcylcDzN+jwIy0WVxL7SY1CreRuvEJAEh36qr9Y/eP
	xvMjPr5luJ+g8CQrSPY6MGSik1XlJJh/hje09xtKrVkl8pnIfdHI58AoAo64HhZtagwYvKAlmia
	s7eouqPt+9/lYg=
X-Google-Smtp-Source: AGHT+IFFQRtEtS/hG2Tw2Y3tZ7JBIHK8O7AtEvWbVFh3c/WKDcNmXYTLq1lKt0Z4JpmLj9iCX/JRFdqRRAtWqZiaZsc=
X-Received: by 2002:a05:6e02:148e:b0:3dc:8075:ccde with SMTP id
 e9e14a558f8ab-3ddce3ed62emr126702145ab.4.1749444194076; Sun, 08 Jun 2025
 21:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com> <20250605061458.196003-2-apatel@ventanamicro.com>
In-Reply-To: <20250605061458.196003-2-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jun 2025 10:13:02 +0530
X-Gm-Features: AX0GCFtusVCpQiVS1V0qV1zXXOQlncy-D3d7CPodLU4fm3d-HJJqnbKjeEFLTPI
Message-ID: <CAAhSdy1O+MvJ6nr0D2+8_9cQ=hT+zW0f-rcg7sw8uP_kuzd25g@mail.gmail.com>
Subject: Re: [PATCH 01/13] RISC-V: KVM: Fix the size parameter check in SBI
 SFENCE calls
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_214315_796619_FB8DB531 
X-CRM114-Status: GOOD (  16.51  )
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxMTo0NeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFzLXBlciB0aGUgU0JJIHNwZWNpZmljYXRpb24sIGFu
IFNCSSByZW1vdGUgZmVuY2Ugb3BlcmF0aW9uIGFwcGxpZXMKPiB0byB0aGUgZW50aXJlIGFkZHJl
c3Mgc3BhY2UgaWYgZWl0aGVyOgo+IDEpIHN0YXJ0X2FkZHIgYW5kIHNpemUgYXJlIGJvdGggMAo+
IDIpIHNpemUgaXMgZXF1YWwgdG8gMl5YTEVOLTEKPgo+IEZyb20gdGhlIGFib3ZlLCBvbmx5ICMx
IGlzIGNoZWNrZWQgYnkgU0JJIFNGRU5DRSBjYWxscyBzbyBmaXggdGhlCj4gc2l6ZSBwYXJhbWV0
ZXIgY2hlY2sgaW4gU0JJIFNGRU5DRSBjYWxscyB0byBjb3ZlciAjMiBhcyB3ZWxsLgo+Cj4gRml4
ZXM6IDEzYWNmZWMyZGJjYyAoIlJJU0MtVjogS1ZNOiBBZGQgcmVtb3RlIEhGRU5DRSBmdW5jdGlv
bnMgYmFzZWQgb24gVkNQVSByZXF1ZXN0cyIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgYXMgYSBmaXggZm9yIExpbnV4LTYuMTYK
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2Uu
YyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYwo+IGluZGV4IDVmYmYzZjk0ZjFlOC4u
OTc1MmQyZmZmZjY4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxh
Y2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYwo+IEBAIC0xMDMs
NyArMTAzLDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9yZmVuY2VfaGFuZGxlcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4KPiAgICAgICAgICAgICAgICAga3Zt
X3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19GRU5DRV9JX1NFTlQpOwo+
ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgU0JJX0VYVF9SRkVOQ0VfUkVN
T1RFX1NGRU5DRV9WTUE6Cj4gLSAgICAgICAgICAgICAgIGlmIChjcC0+YTIgPT0gMCAmJiBjcC0+
YTMgPT0gMCkKPiArICAgICAgICAgICAgICAgaWYgKChjcC0+YTIgPT0gMCAmJiBjcC0+YTMgPT0g
MCkgfHwgY3AtPmEzID09IC0xVUwpCj4gICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X2hmZW5jZV92dm1hX2FsbCh2Y3B1LT5rdm0sIGhiYXNlLCBobWFzayk7Cj4gICAgICAgICAgICAg
ICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfaGZlbmNlX3Z2bWFf
Z3ZhKHZjcHUtPmt2bSwgaGJhc2UsIGhtYXNrLAo+IEBAIC0xMTEsNyArMTExLDcgQEAgc3RhdGlj
IGludCBrdm1fc2JpX2V4dF9yZmVuY2VfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0
cnVjdCBrdm1fcnVuICpydW4KPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2lu
Y3JfZncodmNwdSwgU0JJX1BNVV9GV19IRkVOQ0VfVlZNQV9TRU5UKTsKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIFNCSV9FWFRfUkZFTkNFX1JFTU9URV9TRkVOQ0VfVk1B
X0FTSUQ6Cj4gLSAgICAgICAgICAgICAgIGlmIChjcC0+YTIgPT0gMCAmJiBjcC0+YTMgPT0gMCkK
PiArICAgICAgICAgICAgICAgaWYgKChjcC0+YTIgPT0gMCAmJiBjcC0+YTMgPT0gMCkgfHwgY3At
PmEzID09IC0xVUwpCj4gICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2hmZW5jZV92
dm1hX2FzaWRfYWxsKHZjcHUtPmt2bSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaGJhc2UsIGhtYXNrLCBjcC0+YTQpOwo+ICAgICAgICAg
ICAgICAgICBlbHNlCj4gLS0KPiAyLjQzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
