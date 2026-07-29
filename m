Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F145BC54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZYboSyNyWUvzn8zy8RRsC/I9QDJaOl9rJdDvousg2M=; b=ANrOcBar8NlTnG
	BPj7u2DfMuykKUuUYxL4F53h23T2/dPezL92CZd6dZ4OiUwDEZGFMKxdPi2JWLGh1h45TuUvmhuHW
	G3CDpoF2iMvzvFNHRJFjW3yckpKI1Q+7HSpxw0ouB4gCIkCRUl6BTQlSaZ8Ci0/12YmiK6k8FQE0f
	k7vlp+N2xVqXkesjTYGjPRCbA6PZZZHj7COZjkH2wNiERRYdbHQSnEacA/pQsKZObBj2W/8105WyE
	aH5KIuw2sWXDeypj94byoFiC+XsiXZRKotu0hQ2bnx79xTXA4dU1sKaHEPA4L2LkMpGjdTQYWRQf3
	7j2hG1vtuwcHnMdWxWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozIO-00000007CDz-2VmH;
	Wed, 29 Jul 2026 08:05:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozIM-00000007CDC-0HeL
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 08:05:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso544704f8f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 01:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312340; cv=none;
        d=google.com; s=arc-20260327;
        b=RyJKVBOWzFYTw0ZHA2uq3xb06R/SdwNkdCz+/bFTB2EIq8zFH6mJvCfFPf2EITX2EA
         0upeezDuZ2JXhoTJ7U0Q8A9taH1/MylY6ZeNyrYGXiySVmGBiJG7BhL1h2DiVyaD6OyB
         lKKYLOmo8WSfDd0ewX81VnfuMwiaE3rUoY+mLXMLFXXSWR+7IGObkRdvQ+sHakTloLJ3
         X83XHdGVBymHaL7JDPUVoDse/194Y11HAIIJWL1qIzTgV22hoi9ECttqBgqhRIUvBVhY
         hX7m9oqy5x8minfckbzLpNTdMJss7Jn893q/KuG5d4nRYSoWobDf7u83VtBUmiIfFMZD
         1zKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0Yd6Q4AnWVaWzw13DT5nV/m2mi7w3GBu7PU7kHWGEs=;
        fh=ghlQGipdMi7SLdQBZGYgKgi9xLMpy+yhuxqZN3f7r2g=;
        b=NOu38twJd3HX/hJ92DLNjz80JD0/F9Sj7AQTIdQ9t3W9UWiZlpS9OcyMHPEwlAO683
         EBsmgQF/+UlhFISuBYujlUxKDa3w8RHG4wTS0TDs6T+sC2U1m0jrjmATWDFGrsKt1TKw
         +BKNzTgd0A/dvmi9zcJeMIlHCHwJ6+JM7oPeFVq0gwhEzUwjF/t+/E6NVWMm/S0kLfY/
         Z0Qn0rxS0CYzq89CZWKg75DnCXCR2BVsxRbY7yi1V3Z4+Dgx8WuwB8N7GO7RoUHPsDmP
         8My5uBq9caYUjQ/Tmgd3HQisk56Iz5zeVcHcNGupGRIt7vdcwiozwErCyOF1aKVF3snq
         14VQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785312340; x=1785917140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0Yd6Q4AnWVaWzw13DT5nV/m2mi7w3GBu7PU7kHWGEs=;
        b=m9U6NaTnjcohnNbc6AsxYXJfx0b8ma1Z7a+7eUKWGtnFEegY5yVaS4m7z4O6LBkOD0
         TFWRIyY4hPiA2sLiImp1mYP0Nmrup+G2boGjBCVAnhvQs5Cg2aVrwI/m4MLXFDsbjuTZ
         vjKRxI3PFXazDQ2jfZ1qfaqJf6iPF4CEoVzNuBIIHrYugPtfAfFv10+GkMmoHs8fdGEY
         NQnbHyUYjSfSMkIipitN36s4rjTqnOafRDE28oAh5yBxM5j05Xd8e06iKBrB3m6NlGRP
         wAYJ7U1oOd+NGcAJmEdB64WMMp7kYxU20JN4uZI5I/9gDPHt3hCyxyttND914Kayh92y
         zPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312340; x=1785917140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0Yd6Q4AnWVaWzw13DT5nV/m2mi7w3GBu7PU7kHWGEs=;
        b=Tqo3A+5YhVIjnOhyS15ZkUOMUe7XQtG6dXVzP0MbUKeIEZDMhDRjUhkcCz35uAlX7w
         tNXnZKziKCHS1uu5g7hcuTzjgnQqkylM79FRbz4QN0NSBHjqoqB9pG3ARVUoYWploAE0
         8G9WXmHvaTL2vJ6jXXi0GM1lH/SAbCH8E/+G3EciU4d+7gk+/VU6xzWNGRk9X0fnLtUl
         xkuW8QDoQ72wS/+Lq/hhvCyFOOPbmPHgWgnAz33YEC6+qEP5QdNSo67y2yI6qp4yPl1c
         h2x0/YDl8YHFl84UzHaLil0vsmsaIfm4Mntg7jbATZuH90NaXHA73FbkzjIgB4rAGifi
         rsQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqbv4SCIfokp1WgKGO2NNErGdaeR3tk5Q8hBleS/fARpGl0btW7DDIM79irUVJFkL7Ot0V1ImCfPYk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3x9TQO7EwCQNKBKnqs3aVwCzQZdkYIfxGk+697pop70kTclGK
	EL/tL1Pxp24dfVztTw3UccBFWtUCuKpgxRzYegTt/JR9k9a29olwjH/n4mrDt/C2XIRCuiC4wV3
	VIQ70ryUDgsDTeK3/HaiQU0+dvcuR9Fr21tvQ8IsmtA==
X-Gm-Gg: AR+sD11tgOYxl6G2cc8XuRHEAbNCEX1il0e8sRpDPDa2meX1tDB9nz+2B9R6xN0BT44
	kvvBJbZCatgVsW9WDQC8WD5O57gEZ/QsrQIjcBeO+reSb+r1+8lTOJaGd9p6IbCW0xcUXdwOK7X
	Y70U1NnfWFXU4xNSIY7lojNGB0RcsyruwUXdz2185tN6c34S+Zk7eBdDe28oEF6kLxK+fqhwaGs
	iC1R8O5vOqg6kNIocVNBDGyKRMpFnvhMj65AVWeMX2LiyI+kiHzg2Eq/L6jeO2xgi4kRouypWQQ
	q+BbJxzUQk8tyQYpOk2BnyeVFOeweSMoglImjcplhxjgTkOMsMoZUtjO4QqTRbxXbiTRNrrDkew
	ZOI1lnfw93hg8vF8aklZMU3O/bfZ/Y87VIcofayE9M3tXWlqE3HQq3AFIsNy0d1g=
X-Received: by 2002:a05:6000:25c6:b0:47f:9760:4d25 with SMTP id
 ffacd0b85a97d-47fb1ed9878mr6651215f8f.14.1785312340000; Wed, 29 Jul 2026
 01:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260729070749.730218-1-shanbeeyoo@gmail.com>
In-Reply-To: <20260729070749.730218-1-shanbeeyoo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 13:35:28 +0530
X-Gm-Features: AUfX_mxBw2XjYIsxEgfq92ls8GlDDciTpiLck9rGbZxalgVjWkGw8ru_Xn3sDe0
Message-ID: <CAAhSdy0gaYBv3xktNsMGBA0qGNrOHdZ=Z1D7UTbVHCZuZcu1Nw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix spurious -EEXIST and clean up gstage
 fault path types
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_010542_137778_EDD1DEB9 
X-CRM114-Status: GOOD (  27.28  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMTI6MzfigK9QTSBCaW5neXUuWGlhbiA8c2hhbmJlZXlv
b0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVHdvIHNtYWxsIGZpeGVzIHRvIHRoZSBSSVNDLVYgRy1z
dGFnZSBwYWdlIGZhdWx0IHBhdGgsIGJvdGggc3VnZ2VzdGVkCj4gZHVyaW5nIHJldmlldyBvZiB0
aGUgaW4tcHJvZ3Jlc3MgS1ZNIFVzZXJmYXVsdCBwb3J0Lgo+Cj4gMS4gVHJlYXQgLUVFWElTVCBm
cm9tIGt2bV9yaXNjdl9nc3RhZ2VfbWFwX3BhZ2UoKSBhcyBhIHF1aWV0IHN1Y2Nlc3MuCj4KPiAg
ICBXaGVuIGEgY29uY3VycmVudCB2Q1BVIGluc3RhbGxzIHRoZSBzYW1lIEctc3RhZ2UgbWFwcGlu
ZyB3aGlsZSB3ZQo+ICAgIGFyZSB3YWl0aW5nIGZvciBtbXVfbG9jaywgZ3N0YWdlX21hcF9wYWdl
KCkgcmV0dXJucyAtRUVYSVNULiAgVGhpcwo+ICAgIGlzIG5vdCBhbiBlcnJvciAtLSB0aGUgcGFn
ZSBpcyBjb3JyZWN0bHkgbWFwcGVkIGFuZCB0aGUgZmF1bHRpbmcKPiAgICB2Q1BVIGNhbiBzaW1w
bHkgcmV0cnkgdGhlIGd1ZXN0IGluc3RydWN0aW9uIC0tIGJ1dCBLVk0gd2FzIHRyZWF0aW5nCj4g
ICAgaXQgYXMgb25lOiBwcmludGluZyAiRmFpbGVkIHRvIG1hcCBpbiBHLXN0YWdlIiB0byBkbWVz
ZyBhbmQKPiAgICBwcm9wYWdhdGluZyAtRUVYSVNUIGFsbCB0aGUgd2F5IHRvIHVzZXJzcGFjZS4K
Pgo+ICAgIEFsaWduIFJJU0MtViB3aXRoIHg4NiBhbmQgYXJtNjQsIHdoaWNoIGFscmVhZHkgc3dh
bGxvdyAtRUVYSVNUIGluCj4gICAgdGhlaXIgcmVzcGVjdGl2ZSBmYXVsdCBoYW5kbGVycy4gIFRo
aXMgYWxzbyBsZXRzCj4gICAga3ZtX3JlbGVhc2VfZmF1bHRpbl9wYWdlKCkgZHJvcCBpdHMgInJl
dCAmJiByZXQgIT0gLUVFWElTVCIgc3BlY2lhbAo+ICAgIGNhc2U6IHdpdGggcmV0IG5vcm1hbGl6
ZWQgdG8gMCB0aGUgcmVndWxhciByZWxlYXNlIHBhdGggaXMgY29ycmVjdC4KPgo+IDIuIENsZWFu
IHVwIGZhdWx0IHBhdGggdHlwZXMuCj4KPiAgICAtIHZtYV9wYWdlc2hpZnQ6IHNob3J0IC0+IHVu
c2lnbmVkIGludC4gIEJpdCB3aWR0aHMgYW5kIHNoaWZ0IGNvdW50cwo+ICAgICAgY29udmVudGlv
bmFsbHkgdXNlIHVuc2lnbmVkIGludCBpbiB0aGUga2VybmVsLgo+Cj4gICAgLSBmYXVsdF9hZGRy
OiB1bnNpZ25lZCBsb25nIC0+IGdwYV90LiAgUlYzMiB3aXRoIFN2MzJ4NCBoYXMgMzQtYml0Cj4g
ICAgICBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgdGhhdCB3b3VsZCBiZSB0cnVuY2F0ZWQgd2hl
biBzdG9yZWQgaW4gYQo+ICAgICAgMzItYml0IHVuc2lnbmVkIGxvbmc7IGdwYV90IGlzIHU2NCBv
biBSVjMyIGFuZCBob2xkcyB0aGUgZnVsbAo+ICAgICAgYWRkcmVzcy4gIE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIG9uIFJWNjQuCgpEb24ndCBzcXVhc2ggbXVsdGlwbGUgY2hhbmdlcyBpbnRvIG9uZSBw
YXRjaC4KCkNyZWF0ZSBzZXBhcmF0ZSBwYXRjaGVzIHdpdGggYXBwcm9wcmlhdGUgRml4ZXMgdGFn
cy4KClJlZ2FyZHMsCkFudXAKCj4KPiAgICBUaGVzZSB0eXBlIGNoYW5nZXMgYXJlIGluIHByZXBh
cmF0aW9uIGZvciBzaGFyaW5nIGEgY29tbW9uCj4gICAgc3RydWN0IGt2bV9wYWdlX2ZhdWx0IGFj
cm9zcyBhcmNoaXRlY3R1cmVzLCBhcyByZXF1ZXN0ZWQgZHVyaW5nCj4gICAgcmV2aWV3Lgo+Cj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2Ugb24gUlY2NCBiZXlvbmQgc2lsZW5jaW5nIHRoZSBzcHVyaW91
cyAtRUVYSVNULgo+Cj4gVGhlc2UgYXJlIGluZGVwZW5kZW50IGZpeGVzIHdpdGggbm8gZGVwZW5k
ZW5jaWVzOyB0aGV5IGNhbiBiZSBtZXJnZWQKPiBvbiB0aGVpciBvd24uICBUaGUgS1ZNX01FTV9V
U0VSRkFVTFQgcG9ydCB0aGF0IG1vdGl2YXRlZCB0aGVtIHdpbGwgYmUKPiBzZW50IHNlcGFyYXRl
bHkgYXMgYW4gUkZDIG9uY2UgdGhlIGdlbmVyaWMgdXNlcmZhdWx0IHNlcmllcyBsYW5kcy4KPgo+
IEZpeGVzOiA5ZDA1YzFmZWU4MzcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdlMiBwYWdl
IHRhYmxlIHByb2dyYW1taW5nIikKPiBBc3Npc3RlZC1ieTogWXVhblNoZW5nOiBkZWVwc2Vlay12
NC1wcm8KPiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+
Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCaW5neXUgWGlhbiA8c2hhbmJlZXlvb0BnbWFpbC5jb20+Cj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL21tdS5jICAgICAgIHwgOCArKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X2V4aXQuYyB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJj
aC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCA4YTBhYTVlMGUyMTYuLmQyYTA2YTU0YmUxNyAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21t
dS5jCj4gQEAgLTU0MSw3ICs1NDEsNyBAQCBpbnQga3ZtX3Jpc2N2X21tdV9tYXAoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1zbG90LAo+ICAgICAgICAg
a3ZtX3Bmbl90IGhmbjsKPiAgICAgICAgIGJvb2wgaXNfaHVnZXRsYjsKPiAgICAgICAgIGJvb2wg
d3JpdGFibGU7Cj4gLSAgICAgICBzaG9ydCB2bWFfcGFnZXNoaWZ0Owo+ICsgICAgICAgdW5zaWdu
ZWQgaW50IHZtYV9wYWdlc2hpZnQ7Cj4gICAgICAgICBnZm5fdCBnZm4gPSBncGEgPj4gUEFHRV9T
SElGVDsKPiAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ICAgICAgICAgc3Ry
dWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwo+IEBAIC02NTIsMTEgKzY1MiwxMyBAQCBpbnQga3Zt
X3Jpc2N2X21tdV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21lbW9yeV9z
bG90ICptZW1zbG90LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZtYV9wYWdlc2l6ZSwgdHJ1ZSwgdHJ1ZSwgb3V0X21hcCk7Cj4gICAgICAgICB9Cj4K
PiAtICAgICAgIGlmIChyZXQpCj4gKyAgICAgICBpZiAocmV0ID09IC1FRVhJU1QpCj4gKyAgICAg
ICAgICAgICAgIHJldCA9IDA7Cj4gKyAgICAgICBlbHNlIGlmIChyZXQpCj4gICAgICAgICAgICAg
ICAgIGt2bV9lcnIoIkZhaWxlZCB0byBtYXAgaW4gRy1zdGFnZVxuIik7Cj4KPiAgb3V0X3VubG9j
azoKPiAtICAgICAgIGt2bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShrdm0sIHBhZ2UsIHJldCAmJiBy
ZXQgIT0gLUVFWElTVCwgd3JpdGFibGUpOwo+ICsgICAgICAga3ZtX3JlbGVhc2VfZmF1bHRpbl9w
YWdlKGt2bSwgcGFnZSwgcmV0LCB3cml0YWJsZSk7Cj4gICAgICAgICB3cml0ZV91bmxvY2soJmt2
bS0+bW11X2xvY2spOwo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4g
aW5kZXggNmM4NTMwYjlmMjllLi43NmNjZWVjZWU1YWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9leGl0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IEBA
IC0xNyw3ICsxNyw4IEBAIHN0YXRpYyBpbnQgZ3N0YWdlX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3Zt
X2dzdGFnZV9tYXBwaW5nIGhvc3RfbWFwOwo+ICAgICAgICAgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqbWVtc2xvdDsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgaHZhLCBmYXVsdF9hZGRyOwo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBodmE7Cj4gKyAgICAgICBncGFfdCBmYXVsdF9hZGRyOwo+ICAg
ICAgICAgYm9vbCB3cml0YWJsZTsKPiAgICAgICAgIGdmbl90IGdmbjsKPiAgICAgICAgIGludCBy
ZXQ7Cj4gLS0KPiAyLjU0LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
