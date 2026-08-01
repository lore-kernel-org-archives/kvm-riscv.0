Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A047C5516F
	for <kvm-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EezAefniy7TrRB1G/R1JAiiqV4bmOxMFfDSSDQ/yEuo=; b=AfypiPJaegSQm6
	X5LeIJ7n56LGiLf9oPextEake++HrZ2LeV3QzD9ox7v5Ul2BJCcpaEmr679auRwONQKohad2p5JIp
	myKe0rQK+lz82NbZ5ND6VoDiy/rbUQB78Ll96FfolBC8cDjn+eR7oxeqK2l8cSktZkKmoSuUOAkA+
	58BQoOqM860wmBwxf/k7rRB0kApgkhqRvIudBjDn9QTLWa8N7+0hYaD//9L87SeDqjNiUr++Dq8zR
	uRmzwdjluuqrkv7ha7ToXM6wXCbZL0iiG3WEZ7Tca8m/cmPq9Z8wBOwv+4/wM2bDYK5CR/AJVO4hc
	FbrUEAVYDvfYFgzGMrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Bu-0000000E3VO-3Iun;
	Sat, 01 Aug 2026 08:35:34 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Bs-0000000E3UB-0kuV
	for kvm-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:35:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47de008b020so1252393f8f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785573330; cv=none;
        d=google.com; s=arc-20260327;
        b=XacCdbB/BH1V1kUeiluwX3es/psESlCqh3c0cwxAK6TRR0muTh+OgR76zGp20FP3vX
         OVFb+R1mUEFw+PPCHUofxqbYI7me+VpJyZ1TbnYTax/o2svHnWhsm6dOh9AV419jBKj/
         JBxcDSdRqbvgR5CIxOP6KyuvIKbB2RSc/i1sEwwVzZcz/Scp4qUoEuDZMFA0/txyPIDS
         ofjF1SQElhQetegeX2mYZv3gnnfGPyFhkljJCYuL1lXfUyHlJmDFEbIKph7xUAGsHr86
         qEqyhTHUw1AsW/FfDxazHKuaY/0gqdxVYtI5Xc9gyCLj+TVZxO5HoOI5BsgY8C9QO8qG
         pXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUTf6pJUeP1uJ/800+RmRcBQOzqOSOy6aUpAs+g0B94=;
        fh=F3D8zsgLiLLuMDU3+boYfJWVMiQEIPNXPyWfvZDBIHI=;
        b=sArm2riRTgyanGHqtAkvRC5mxZn2JFS9xZLVNu4a7TNdsSJKvcU4D0CYVmoe9e9J32
         n/f6NXxLxcmBE1qnOHPd88SaLZmf/hRIRaPTHbiM3YeifnWyvxXDsATjBvFO7oKukz/X
         /Z/dA8R27MXf620V+mKKk92y6iShNDgePAKcZXbAk7ANAdYyYxvKjPFVA6pmaTODwJW0
         W+IX7NpeMA8/m4G4hDKiZ8HLqnnSrwKidP2mlrWPC5x9sNMr1wHMxRX49JyNyr8RJDvE
         qI7k7mPpr9tNCVASgOks/YJyCSVlZNm85DP5h2+mcdXdRXTNv3N+8rK7+x26iPI6uXk2
         ZgJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785573330; x=1786178130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUTf6pJUeP1uJ/800+RmRcBQOzqOSOy6aUpAs+g0B94=;
        b=oVpTzg27Tmt7yILWfQSoRwsG++SsmH3FQih6E/J42V0r/fVNr4QlolNKff5ZSxecnH
         FTmczj//hx02doA6h1UWR1dNkuT+X2TMcww/oIyiYq0MseqYFiBr628yAoeI4hu2gBB6
         33JIKllAkKjf6w6Ccm3U/fhHN/s8uCtpSHYrzJKGvj9jQimRwR5i7++yO+Dt8tvM6vzL
         7+nWT5sVX02KUoJ61LpAOhgdk+Zf+6CWP4YnvWxShLRjLMAu9yyY81CRhs9Sg01mUpxD
         iZrq++S4264FwvQjTW54VDdNlMslqIRDqXFdlp6yIyVF+nGHneT4e0oGzbiXnz2Bw3ir
         YmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785573330; x=1786178130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUTf6pJUeP1uJ/800+RmRcBQOzqOSOy6aUpAs+g0B94=;
        b=W2l6oIzCFuRUoHdAMV3MqlXyFpMjpVUqXnuklKNdPezXd36E5IYsZkJgT6N+HKvKIA
         1SpToZRmWZlNxcPBc8Rp7U1qy7FJwcC3OzPFwjYhp0BYCw21hqj0fysfi+f+imIliHlO
         PpyIob4Y19IrF2NVmU4B/5WnrHTHJ957iGTKScBtmOG8/iIfwukbO0Pw5r+KhNEwnvK1
         H5jG3mSnXNf0ZSslqo2VqBv4hZXLKAi/BsboMeykB6MO6jyUtuPAskuruX34Ipayj/03
         LKnivrU8SaFaLJVHFLxtMv30Dvtdq5al6/JamqrTyQpnQUB7f7IvMGm+T8q+bhnluIzd
         7StQ==
X-Forwarded-Encrypted: i=1; AHgh+RomUAIziOoe0GEhG5i934MRm4e+8CUaFhXrVdNsQRZQ86b4vzjwzGyI3prJGltO5L4NxDLgjJWPyGM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/KtPDctasTYHO8wF5C/P4Ja2lce3pWTpUQKpBs3kdkR1ylC7V
	0C54Le376CrwMr9bewWcBUlUptikV3Bx65QMRYZg51WJzkgUFRJEqFGe8YDziCW5cLXQmMOxD4S
	f9KRK+ROZNNjoRM0PGw5Yf2svfW1/7y2R/pmsqwaPWg==
X-Gm-Gg: AR+sD12joYAWxDPmpbL0MYpcvwY5GvS5mzAx8G3myKHq0miux1UkBmP3c0sl9N/QHhe
	yPey7s5fV8dPQ2YhaZxuO4weILGhOiardk1LqHh/gOxD2A7FqLFWh8xD3SA65s/WD9sZqInbKqj
	g3FP1qwfCShihFv20wmQjfyB0WFP0jUVQqRpwMSGz3Idvi7N6sr23iaNZPqhn2I6z0Zyt7/WBS1
	jaPBI3ZfTv9cvAG4LsOVv4sUut3gqlOszB11luWYgOz85sKZW+LhnBjZif/CpIx9R70kLGcV0Io
	Hk2RgQhgpPB55CH016oLpCj1+5yo0cl7fqlsck6ran59lu8tzBmCjAWWXHVBRJZN7PkhzNn7iaJ
	W7izLhpzCPBYqJRxas4OPa0F5DtLiz2H1q5n9/ZieB4dFKx1hX/DclROF7Q2hSnn4DzWWIGxWOl
	v8
X-Received: by 2002:a05:6000:1846:b0:47f:6e8b:699c with SMTP id
 ffacd0b85a97d-47fd729208fmr5228759f8f.14.1785573330190; Sat, 01 Aug 2026
 01:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn> <20260731093833.1551341-3-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731093833.1551341-3-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:05:18 +0530
X-Gm-Features: AUfX_mxVZMTqUYg5I25kzku9hNu-Y6ngd-XdOTNy6Xs3S7Apun6Etlayif9FnM8
Message-ID: <CAAhSdy1r=wfR3j5da2DtyiitNi6S5EOrRAh6Nv6kMqZDBpMMhg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: Introduce make_xfence_request_nodata
 for FENCE.I requests
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_013532_255920_911D1E42 
X-CRM114-Status: GOOD (  19.35  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMzoxMuKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IEZFTkNFLkkgZG9lcyBub3QgbmVlZCBoZmVuY2Ug
ZGF0YSwgYnV0IGl0IGN1cnJlbnRseSBnb2VzIHRocm91Z2ggdGhlCj4gZ2VuZXJpYyBtYWtlX3hm
ZW5jZV9yZXF1ZXN0KCkgcGF0aCB3aXRoIE5VTEwgZGF0YSwgaW5jdXJyaW5nIHVubmVjZXNzYXJ5
Cj4gcGVyLVZDUFUgY2hlY2tzLgo+Cj4gU3BsaXQgb3V0IGEgc2VwYXJhdGUgbWFrZV94ZmVuY2Vf
cmVxdWVzdF9ub2RhdGEoKSBmdW5jdGlvbiB0byBoYW5kbGUKPiBGRU5DRS5JIGRpcmVjdGx5LCBh
bmQgbW92ZSB0aGUgZGF0YSB2YWxpZGl0eSBjaGVjayB0byB0aGUgdG9wIG9mIHRoZQo+IGdlbmVy
aWMgZnVuY3Rpb24gdG8gYXZvaWQgcmVkdW5kYW50IGNoZWNrcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS90bGIuYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdGxiLmMgYi9hcmNoL3Jpc2N2L2t2
bS90bGIuYwo+IGluZGV4IGM1NDUyMmRlY2FhNjQuLmZkNDQ1ZTlmYTNmOTQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS90bGIuYwo+IEBA
IC0zMjUsNiArMzI1LDI5IEBAIHZvaWQga3ZtX3Jpc2N2X2hmZW5jZV9wcm9jZXNzKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIH0KPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIG1ha2VfeGZl
bmNlX3JlcXVlc3Rfbm9kYXRhKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyBoYmFzZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGht
YXNrLCB1bnNpZ25lZCBpbnQgcmVxKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGk7Cj4g
KyAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7Cj4gKyAgICAgICBERUNMQVJFX0JJVE1BUCh2
Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICsKPiArICAgICAgIGJpdG1hcF96ZXJvKHZjcHVf
bWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gKyAgICAgICBrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1
LCBrdm0pIHsKPiArICAgICAgICAgICAgICAgaWYgKGhiYXNlICE9IC0xVUwpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAodmNwdS0+dmNwdV9pZCA8IGhiYXNlIHx8Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2Y3B1LT52Y3B1X2lkID49IGhiYXNlICsgQklUU19QRVJf
TE9ORykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGlmICghKGhtYXNrICYgKDFVTCA8PCAodmNwdS0+dmNwdV9pZCAt
IGhiYXNlKSkpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
KyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGJpdG1hcF9zZXQodmNwdV9t
YXNrLCBpLCAxKTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBrdm1fbWFrZV92Y3B1c19yZXF1
ZXN0X21hc2soa3ZtLCByZXEsIHZjcHVfbWFzayk7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG1h
a2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBoYmFzZSwgdW5zaWduZWQgbG9uZyBobWFzaywKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZXEsIHVuc2lnbmVk
IGludCBmYWxsYmFja19yZXEsCj4gQEAgLTMzNSw2ICszNTgsOSBAQCBzdGF0aWMgdm9pZCBtYWtl
X3hmZW5jZV9yZXF1ZXN0KHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgIERFQ0xBUkVfQklUTUFQ
KHJlcV92Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICAgICAgICAgREVDTEFSRV9CSVRNQVAo
ZmFsbGJhY2tfcmVxX3ZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4KPiArICAgICAgIGlmICgh
ZGF0YSB8fCAhZGF0YS0+dHlwZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAg
ICAgIGJpdG1hcF96ZXJvKHJlcV92Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICAgICAgICAg
Yml0bWFwX3plcm8oZmFsbGJhY2tfcmVxX3ZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gICAg
ICAgICBrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1LCBrdm0pIHsKPiBAQCAtMzQ2LDExICszNzIs
NiBAQCBzdGF0aWMgdm9pZCBtYWtlX3hmZW5jZV9yZXF1ZXN0KHN0cnVjdCBrdm0gKmt2bSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAg
ICB9Cj4KPiAtICAgICAgICAgICAgICAgaWYgKCFkYXRhIHx8ICFkYXRhLT50eXBlKSB7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgYml0bWFwX3NldChyZXFfdmNwdV9tYXNrLCBpLCAxKTsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAtICAgICAgICAgICAgICAgfQo+IC0K
PiAgICAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICogRW5xdWV1ZSBoZmVuY2Ug
ZGF0YSB0byBWQ1BVIGhmZW5jZSBxdWV1ZS4gSWYgd2UgZG9uJ3QKPiAgICAgICAgICAgICAgICAg
ICogaGF2ZSBzcGFjZSBpbiB0aGUgVkNQVSBoZmVuY2UgcXVldWUgdGhlbiBmYWxsYmFjayB0bwo+
IEBAIC0zNjksOCArMzkwLDcgQEAgc3RhdGljIHZvaWQgbWFrZV94ZmVuY2VfcmVxdWVzdChzdHJ1
Y3Qga3ZtICprdm0sCj4gIHZvaWQga3ZtX3Jpc2N2X2ZlbmNlX2koc3RydWN0IGt2bSAqa3ZtLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBoYmFzZSwgdW5zaWduZWQgbG9u
ZyBobWFzaykKPiAgewo+IC0gICAgICAgbWFrZV94ZmVuY2VfcmVxdWVzdChrdm0sIGhiYXNlLCBo
bWFzaywgS1ZNX1JFUV9GRU5DRV9JLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1f
UkVRX0ZFTkNFX0ksIE5VTEwpOwo+ICsgICAgICAgbWFrZV94ZmVuY2VfcmVxdWVzdF9ub2RhdGEo
a3ZtLCBoYmFzZSwgaG1hc2ssIEtWTV9SRVFfRkVOQ0VfSSk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9y
aXNjdl9oZmVuY2VfZ3ZtYV92bWlkX2dwYShzdHJ1Y3Qga3ZtICprdm0sCj4gLS0KPiAyLjM5LjMK
PgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
