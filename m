Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C63CCD1AB
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 03:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGghTh2Vl6DUaglR9y/MgEKZNH3lPI+eZ+VmXYvFSY8=; b=hUMzzL+PVFu/J8
	Qnt3DW1hta1Q86fY+b5Bw8kpkaT9Q/t630bJAnIIJ/uwL2RwMBX22nZfSc46m9ncnCvZ2HTZi3zuQ
	bzxih/fvGjdp42u0VdR0D1kaahzdG+1SnK0LceU+FmJ63qp7mOXRrFdT2I1rmpq+ojg9oOsRAZlTY
	gIaT9+Pfn3QuLsy20IxWO3VPEdDDr3NxcwaKDncjla4mHehzun+1PKcD9/u48YUV8WaQ/Ar1lmuS1
	B6PQH8Oo9Kf6d5pwKmNuWyWazDyfxbAlNX1+0SjQkysJ/QA3Y+ZdNK08THfo/7wnFBDZC8Pqf5Ns6
	ZIl28xh5v5YO/jxtg27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8qr-00000008BHo-2uSf;
	Fri, 24 Oct 2025 03:52:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8qo-00000008BGG-2Xyc
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 03:52:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-592f7e50da2so1578166e87.0
        for <kvm-riscv@lists.infradead.org>; Thu, 23 Oct 2025 20:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761277944; x=1761882744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8/9xfrwSY9dn/jrCOm3aVeNQtdTtccDMKuiFbDhKLw=;
        b=CN+mzaI+NW5AuI0meAWB8a1GbkygLoU+M+a4xAyLXIFZcq1swgqBywWa0e0CCzujqx
         O0qNDMascglfAJZpgiS4irHW9XsTMmu2xns6eK5OlYGc0nVE58hnzdfw2HTTozhvHYIF
         zwjm8qtLknhyp9jgNZFhtAphDIXBQv3UrUaFUnvBDOCyv3srAXLNrKPGxmmc5VQOEPHk
         gNxbCXQgRlrJqFN16OhAyW11dK3X2x30k5uZau5P0No4dNiL0v+l72qo6sMB/3o2hFYg
         m2HGvnMrPRTxvemllD5y4dTtr1s8K1LlaRXO03uG3BrCZJM/ycYowJ0y9Me8YVm13S7q
         0/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761277944; x=1761882744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8/9xfrwSY9dn/jrCOm3aVeNQtdTtccDMKuiFbDhKLw=;
        b=V6duidnIMNuwkjTG/2Sm/V/TRAE1EqELKesIpEpL7P8bX3pNZ9b20eJZ48sJYAgClG
         vSWbbSJwGnnianYg8DN+NK/iTznl5oDTciKWsQ8RkUaEaJGD2we3PoRX0RehRzVVlxqY
         sbxEIAwWy7ofKwUwwUWj/TgLo6VkPxQAqYiWmXt4pU8+WiOE9YE1Wtgv0tdKM58kPjlY
         Farojb6X9hOj9ZzAzFHgb3BSwqGRCrzIP4kesWNhguK2HZ5p0MO1gL3HiwfofS3T4BgK
         Ux1D1TvCxFXCuVzfWcyZhZwsU4lKNXwGapq0vswWeg5YSt5emjOrTylZ6Ccvq8KXkKEW
         FmFg==
X-Forwarded-Encrypted: i=1; AJvYcCVNAN2xbKfRQy/xR7xp8uuTWbIKmOqeCeXMoZxTm4kbTzDPRGHVR/kebLckqjYmUhUg6Wwhpw7rYf0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv3jLIn8djQwiQSwjb4g/rnY8y92qmipmFdKlTzErLa4qWTzAr
	gUeIXoHXkehRyBOilbzzgXM0SC4Kol4e3VsXliKI/MXEePr/HqT0BxEcfC06dRdykovfH/L4Jj7
	x7ZtIQ04Wso2ZPuOhM1S/0p90LxH1m6zJf73TpAgkZQ==
X-Gm-Gg: ASbGncuzfNKFYJncsbTigAyuoJVG7FzGSD/bgDf1Bm16ckD0xveIftlweAuVwV2Wmq/
	j6ji/WXmdWD1dZZ0Tpu+91lbkPmAsFgb2spb9yHxqf9N2oZcAmTD3NFObEP0mEaYb2uGIvYs1Nk
	9xSfRoY4sJJQ49Dn6bAgA5StoaLUFwD30c31lVVeW3c9rZhM7WUB1pSxlxlH9V04SKqRv1adllS
	vHfaJn+XsoRFnYEGrqUMQBCB/Xc94GIMUNXjIv0Wp+srKnSPBluhpGbAmwbFUZJWxxTDGdV
X-Google-Smtp-Source: AGHT+IGb8L9/8BFJcEWEY2fXEF0PpwWiveByTWgaE2reqnXO8Ueo0FIjsxeuMtM0ZpRN/r3UT6XdkbR16N4L1XohwP8=
X-Received: by 2002:a05:6512:3e06:b0:58b:75:8fc6 with SMTP id
 2adb3069b0e04-592fc12a69emr299952e87.19.1761277944103; Thu, 23 Oct 2025
 20:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251021083105.4029305-1-minachou@andestech.com>
In-Reply-To: <20251021083105.4029305-1-minachou@andestech.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 24 Oct 2025 09:22:12 +0530
X-Gm-Features: AS18NWBEuD60NgNp1jRJyfwYOeWuqAqMI2kePlnJ_4peqxX3K4YiUIFQFddLt-A
Message-ID: <CAK9=C2XjygELuUnQErbpVzh6-4wc4HHypf91aKUtUzMYGJwmtw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration
 to prevent stale entries
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tim609@andestech.com, ben717@andestech.com, 
	az70021@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_205226_676991_DC9DBF8C 
X-CRM114-Status: GOOD (  22.85  )
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMjowMuKAr1BNIEh1aSBNaW4gTWluYSBDaG91CjxtaW5h
Y2hvdUBhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEZyb206IEh1aSBNaW4gTWluYSBDaG91IDxt
aW5hY2hvdUBhbmRlc3RlY2guY29tPgo+Cj4gSWYgbXVsdGlwbGUgVkNQVXMgb2YgdGhlIHNhbWUg
R3Vlc3QvVk0gcnVuIG9uIHRoZSBzYW1lIEhvc3QgQ1BVLAo+IGhmZW5jZS52dm1hIG9ubHkgZmx1
c2hlcyB0aGF0IEhvc3QgQ1BV4oCZcyBWUy1zdGFnZSBUTEIuIE90aGVyIEhvc3QgQ1BVcwo+IG1h
eSByZXRhaW4gc3RhbGUgVlMtc3RhZ2UgZW50cmllcy4gV2hlbiBhIFZDUFUgbGF0ZXIgbWlncmF0
ZXMgdG8gYQo+IGRpZmZlcmVudCBIb3N0IENQVSwgaXQgY2FuIGhpdCB0aGVzZSBzdGFsZSBHVkEg
dG8gR1BBIG1hcHBpbmdzLCBjYXVzaW5nCj4gdW5leHBlY3RlZCBmYXVsdHMgaW4gdGhlIEd1ZXN0
Lgo+Cj4gVG8gZml4IHRoaXMsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5pdGl6ZSgpIGlzIGV4
dGVuZGVkIHRvIGZsdXNoIGJvdGgKPiBHLXN0YWdlIGFuZCBWUy1zdGFnZSBUTEJzIHdoZW5ldmVy
IGEgVkNQVSBtaWdyYXRlcyB0byBhIGRpZmZlcmVudCBIb3N0IENQVS4KPiBUaGlzIGVuc3VyZXMg
dGhhdCBubyBzdGFsZSBWUy1zdGFnZSBtYXBwaW5ncyByZW1haW4gYWZ0ZXIgVkNQVSBtaWdyYXRp
b24uCj4KPiBGaXhlczogOTJlNDUwNTA3ZDU2ICgiUklTQy1WOiBLVk06IENsZWFudXAgc3RhbGUg
VExCIGVudHJpZXMgd2hlbiBob3N0IENQVSBjaGFuZ2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBIdWkg
TWluIE1pbmEgQ2hvdSA8bWluYWNob3VAYW5kZXN0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBC
ZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KCkhlcmUncyB3aGF0IHRoZSBu
b24tbm9ybWF0aXZlIHRleHQgc2F5cyBhYm91dCBIRkVOQ0UuR1ZNQSAuLi4KCiJDb25jZXB0dWFs
bHksIGFuIGltcGxlbWVudGF0aW9uIG1pZ2h0IGNvbnRhaW4gdHdvIGFkZHJlc3MtdHJhbnNsYXRp
b24KY2FjaGVzOiBvbmUgdGhhdAptYXBzIGd1ZXN0IHZpcnR1YWwgYWRkcmVzc2VzIHRvIGd1ZXN0
IHBoeXNpY2FsIGFkZHJlc3NlcywgYW5kIGFub3RoZXIKdGhhdCBtYXBzIGd1ZXN0CnBoeXNpY2Fs
IGFkZHJlc3NlcyB0byBzdXBlcnZpc29yIHBoeXNpY2FsIGFkZHJlc3Nlcy4gSEZFTkNFLkdWTUEg
bmVlZApub3QgZmx1c2ggdGhlCmZvcm1lciBjYWNoZSwgYnV0IGl0IG11c3QgZmx1c2ggZW50cmll
cyBmcm9tIHRoZSBsYXR0ZXIgY2FjaGUgdGhhdAptYXRjaCB0aGUgSEZFTkNFLkdWTUHigJlzCmFk
ZHJlc3MgYW5kIFZNSUQgYXJndW1lbnRzLiIKIk1vcmUgY29tbW9ubHksIGltcGxlbWVudGF0aW9u
cyBjb250YWluIGFkZHJlc3MtdHJhbnNsYXRpb24gY2FjaGVzCnRoYXQgbWFwIGd1ZXN0IHZpcnR1
YWwKYWRkcmVzc2VzIGRpcmVjdGx5IHRvIHN1cGVydmlzb3IgcGh5c2ljYWwgYWRkcmVzc2VzLCBy
ZW1vdmluZyBhIGxldmVsCm9mIGluZGlyZWN0aW9uLiBGb3Igc3VjaAppbXBsZW1lbnRhdGlvbnMs
IGFueSBlbnRyeSB3aG9zZSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgbWFwcyB0byBhIGd1ZXN0CnBo
eXNpY2FsIGFkZHJlc3MgdGhhdAptYXRjaGVzIHRoZSBIRkVOQ0UuR1ZNQeKAmXMgYWRkcmVzcyBh
bmQgVk1JRCBhcmd1bWVudHMgbXVzdCBiZSBmbHVzaGVkLgpTZWxlY3RpdmVseQpmbHVzaGluZyBl
bnRyaWVzIGluIHRoaXMgZmFzaGlvbiByZXF1aXJlcyB0YWdnaW5nIHRoZW0gd2l0aCB0aGUgZ3Vl
c3QKcGh5c2ljYWwgYWRkcmVzcywgd2hpY2ggaXMKY29zdGx5LCBhbmQgc28gYSBjb21tb24gdGVj
aG5pcXVlIGlzIHRvIGZsdXNoIGFsbCBlbnRyaWVzIHRoYXQgbWF0Y2gKdGhlIEhGRU5DRS5HVk1B
4oCZcwpWTUlEIGFyZ3VtZW50LCByZWdhcmRsZXNzIG9mIHRoZSBhZGRyZXNzIGFyZ3VtZW50LiIK
ClRoaXMgbWVhbnMgLi4uCgpGb3IgaW1wbGVtZW50YXRpb25zIChtb3N0IGNvbW1vbikgd2hpY2gg
aGF2ZSBUTEJzIGNhY2hpbmcKZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIHRvIHN1cGVydmlzb3IgcGh5
c2ljYWwgYWRkcmVzcywgdGhlCmt2bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3ZtYV92bWlkX2FsbCgp
IGlzIHN1ZmZpY2llbnQgdXBvbgpWQ1BVIG1pZ3JhdGluZyB0byBhIGRpZmZlcmVudCBob3N0IENQ
VS4KCkZvciBpbXBsZW1lbnRhdGlvbnMgKHJlbGF0aXZlbHkgdW5jb21tb24pIHdoaWNoIGhhdmUg
VExCcwpjYWNoaW5nIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcyB0byBndWVzdCBwaHlzaWNhbCBhZGRy
ZXNzLCB0aGUKSEZFTkNFLkdWTUEgd2lsbCBub3QgdG91Y2ggZ3Vlc3QgdmlydHVhbCBhZGRyZXNz
IHRvIGd1ZXN0CnBoeXNpY2FsIGFkZHJlc3MgbWFwcGluZyBhbmQgS1ZNIG11c3QgZXhwbGljaXRs
eSBzYW5pdGl6ZQpWUy1zdGFnZSBtYXBwaW5ncyB1c2luZyBIRkVOQ0UuVlZNQSAobGlrZSB0aGlz
IHBhdGNoKQp3aGVuIG1pZ3JhdGluZyBWQ1BVIHRvIGEgZGlmZmVyZW50IGhvc3QgQ1BVLgoKV2Ug
c2hvdWxkIG5vdCBwZW5hbGl6ZSBhbGwgaW1wbGVtZW50YXRpb25zIGJ5IGV4cGxpY2l0bHkgY2Fs
bGluZwprdm1fcmlzY3ZfbG9jYWxfaGZlbmNlX3Z2bWFfYWxsKCkgIHJhdGhlciB0aGlzIHNob3Vs
ZCBiZSBvbmx5CmRvbmUgb24gaW1wbGVtZW50YXRpb25zIHdoZXJlIGl0IGlzIHJlcXVpcmVkIHVz
aW5nIGEgc3RhdGljIGp1bXAuCk9uZSBwb3NzaWJsZSB3YXkgb2YgZGV0ZWN0aW5nIHdoZXRoZXIg
dGhlIHVuZGVybHlpbmcgaW1wbGVtZW50YXRpb24KbmVlZHMgZXhwbGljaXQgSEZFTkNFLlZWTUEg
dXBvbiBWQ1BVIGlzIHRvIHVzZSBtYXJjaGlkLAptaW1waWQsIGFuZCBtdmVuZG9yaWQuIEFub3Ro
ZXIgd2F5IGlzIHRvIHVzZSBpbXBsZW1lbnRhdGlvbgpzcGVjaWZpYyBDUFUgY29tcGF0aWJsZSBz
dHJpbmdzLgoKUmVnYXJkcywKQW51cAoKCgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBVcGRh
dGVkIEZpeGVzIGNvbW1pdCB0byA5MmU0NTA1MDdkNTYKPiAtIFJlbmFtZWQgZnVuY3Rpb24gdG8g
a3ZtX3Jpc2N2X2xvY2FsX3RsYl9zYW5pdGl6ZQo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZtaWQuYyB8
IDggKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZtaWQuYwo+IGluZGV4IDNiNDI2YzgwMDQ4MC4uNjMyM2Y1MzgzZDM2IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+
IEBAIC0xMjUsNyArMTI1LDcgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfdXBkYXRlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAga3ZtX21ha2VfcmVxdWVzdChL
Vk1fUkVRX1VQREFURV9IR0FUUCwgdik7Cj4gIH0KPgo+IC12b2lkIGt2bV9yaXNjdl9nc3RhZ2Vf
dm1pZF9zYW5pdGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3ZvaWQga3ZtX3Jpc2N2X2xv
Y2FsX3RsYl9zYW5pdGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgdm1pZDsKPgo+IEBAIC0xNDYsNCArMTQ2LDEwIEBAIHZvaWQga3ZtX3Jpc2N2
X2dzdGFnZV92bWlkX3Nhbml0aXplKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAg
dm1pZCA9IFJFQURfT05DRSh2Y3B1LT5rdm0tPmFyY2gudm1pZC52bWlkKTsKPiAgICAgICAgIGt2
bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3ZtYV92bWlkX2FsbCh2bWlkKTsKPiArCj4gKyAgICAgICAv
Kgo+ICsgICAgICAgICogRmx1c2ggVlMtc3RhZ2UgVExCcyBlbnRyeSBhZnRlciBWQ1BVIG1pZ3Jh
dGlvbiB0byBhdm9pZCB1c2luZwo+ICsgICAgICAgICogc3RhbGUgZW50cmllcy4KPiArICAgICAg
ICAqLwo+ICsgICAgICAga3ZtX3Jpc2N2X2xvY2FsX2hmZW5jZV92dm1hX2FsbCh2bWlkKTsKPiAg
fQo+IC0tCj4gMi4zNC4xCj4KPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
