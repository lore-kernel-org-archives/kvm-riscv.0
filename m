Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AD7CF65DD
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/pdLxwosRXcU3yDpN1+fxiRp+subiqQA3fkjZaCCqU=; b=npHM50UZq8ibBe
	X7S0rkR7EQBWbl10smhqH99cNoYxYyCQ8a1lMSVVHvYzKKbRLRBgl5n+7C0QFz5PHSHy6dK0+4j3d
	bXZDvlPGWSEjbgyYMzcg5tivmU0bD5qWM7ZVYP4Zg0teYV35kPzorVcFhhajSGkWDBufFqpybVvde
	ZRkUGdUkB/64c10p/vzBwAYUgzopipEpxrUNuPZsuoRPYgv+5QZaVYUnaUnYwmqDJzs9N0exoRaxJ
	kpGyDETK+2JdrJ7rY3w8VA8REA1zz3se/w+PoOyKXM1FXprQlAz/C9hXgec8rJkkZ6oPuDLgl+T4o
	58Z39INKHPU47fXafX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKLu-0000000CNO3-3oN4;
	Mon, 26 Jan 2026 11:01:51 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKLq-0000000CNMV-3pCL
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 11:01:49 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-4042905015cso2727106fac.0
        for <kvm-riscv@lists.infradead.org>; Mon, 26 Jan 2026 03:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769425306; cv=none;
        d=google.com; s=arc-20240605;
        b=WsEz9JAw/2gTXjzTzPzDvrRwqDxsQ/Ae0TM8rraI9ixO7s6c18oKXya4OL0ChauzEN
         sAWKndXMHuaCM+1Pophd5cl2z8uowbtVoEjdL9rFsr5bSNeFgmg1XxnRoyvBJ3wc2/9h
         jYTiGSOz/d3iRCB2NJn0ECN7j7tdPdYkCBcvFMhqna1WYkg+IzLPQU3+NLN5bEidQRFa
         fdH7DD+NRNvY05sizHGXhbsLwmG50wl28rkNqFnKq2UNbfHWi4K3unDulw0aIYIL3FBu
         GGwPOSQNnAid2fd4gJxrzpVFKiER29aSFVoBq+AuLDs6T/N68vXyqT/STOO/dmreDnOa
         sqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNQC2GhUUe78LWTdamvuxQ+2JSUG6qZ/+66tSASqYfI=;
        fh=3Jo6O6cV53viql6OebYtajS99Fc4vh6vbIlprAK+ADo=;
        b=aDb8m/zjGy1Qay/iakwyB3adoq8Pf1uxaU7Hfz2w2T2calVITuOiquSTvNLWkJmnlx
         nqqcY4Cor2Vf4ipyFLTDhIdRZG2KMmu2PHOAafdmIPpxh8uj9rzs+a1nXExknsAOhcUg
         YHwp2JDvD1bLqIab9z4mTYqfT43yRV2zggadYatLpP038XFcmgb/Div97tFvwlOW4fhP
         lqWkv4K3cwlqIedrqJ/rUjys5qFTyEGFOA5/NdrJoSM2yu3lNJhdSErVRT6btnDEB4Y+
         jyHQO91+jA/rhw1TdaDG6xQs3S/Wpb1OARasXKsq26DAEbPXoU9egFAwL5Jg9/dWwElp
         k/8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769425306; x=1770030106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNQC2GhUUe78LWTdamvuxQ+2JSUG6qZ/+66tSASqYfI=;
        b=S+pw8wzO/z+94Kw5dsXGWlmdEky/05AtYvKrRTCkTu3xk2Tv9TdGePzvEWawJNgW52
         /Cv3tsWEdzR5kyqB1jqEsFLwe1X7d+UUopTye9RYpU2UedW3SgraaBHKqFsL2MaAFSU4
         n3I1wIqRzcEDQ2zN/FJD1sJkBT9hbURPaNyI6MYpMQs0yFscHN7C1sbMTVDP+QddcUsI
         dhT8tfM4woMgOAi9JsSo97/1D/kMMnjX8ftzOnPHvF28QgzbZaWFeeAAutqbKwdRjKpK
         6sYPeZMrX9tjByNW4nBLn4Rj0RFs+Or0fQRfb4u37G144rgC3xCwrSBGC4LKZGzh3xUd
         4KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425306; x=1770030106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yNQC2GhUUe78LWTdamvuxQ+2JSUG6qZ/+66tSASqYfI=;
        b=ThHucdfMRBchtm/daRE2h+Wgkc35qdX83/r3O3ygSMOGVUY7VehciLzLWJGdqaGAy+
         NiAswLBRH96B7E/mmq02/CULknHpk/PrygDK7Wny8bXmTMSBhmu1sUUlQHBUmSaG7dlZ
         rf1PzoOXUWjN1hMTqaUwpv6zLWzWia8HisgNWboNkgfhFj3kh0Z/eLnSE1arhFonLcsD
         epERt8E/RvFXicYYDVCTHJwL40jcQNDJ6mvvQDuC80guaD8gtKF1G1tT9qei30ShuV1y
         nkgCKOIpKKN4RcUmOLGXM9oS/vBmXhQF2g0ev0oPF+DiBvu5kfSqcWs2/S0Kyu4ZS513
         SVnw==
X-Forwarded-Encrypted: i=1; AJvYcCUmX/1ucVnLEuml+nkRRTd9xk9o8kSZ7WDbdp7FHdpkVE7cRu4HER/UQMRjEhPwmcJz8OZTLUUH1wE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/f8PyodjCQIMwNQerXtxSGq/U+cG1ENYbvRn21jEexHRCMfGz
	KgLoF21HexWA+wgvSYLnuY+o9vIHIsi5Pwjh5wQfDnEVIwVSdLvWm5FkYhCcusSXBTS4WZ9ibz1
	/r3zwlrcHzqp6XknFM46fEwZunHDpFwcWg9BjzgdlRQ==
X-Gm-Gg: AZuq6aIDT4r+K3dKl9MY+S589FpiuI18IfN4cdm0QGJucyV2kQF1d665xuY2IZtUcai
	yzls9Cvr/0m3OmhezGTcyYtW5fFqRXXVrsuKRVrA+JjlbR1hC4M5GdpUxzCNbJJyJO8b+5g0DQe
	bTQoOF3fPp2i/jeeYiyYveOwRgC51vogqysIbA1pdcNMbzXuLy3J7q/gSiqRiMym9ijGb8dSh1Z
	M5F9BaR6hCgrML0ZEzwUYSdsNOC3hPkkXa3QmpUoPazOnJd6pSQni6Lig80dNHf3XbbV6fmeJ3k
	W153wyrhgySPiX4axRDnY4QYF87qogtYvuoR0tvQYYeJ/jAcO602jVo3ow==
X-Received: by 2002:a4a:e84a:0:b0:659:9a49:8f99 with SMTP id
 006d021491bc7-662e03daedamr1690050eaf.18.1769425305682; Mon, 26 Jan 2026
 03:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jan 2026 16:31:32 +0530
X-Gm-Features: AZwV_QhwclxTcj0A8174pE-hkh_gKAJoKfsUQlzQMfllaSIpHrjIxI6lcFRhMeg
Message-ID: <CAAhSdy03Ujgn0K7xQNFoydWDiohU5PE6bbSt=tPLCBHd7BaZYw@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030147_009697_5638FEFC 
X-CRM114-Status: GOOD (  23.70  )
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

T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgODowM+KAr1BNIEppYWthaSBYdSA8amlha2FpcGVhbnV0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBudWxsIHBvaW50ZXIgY2hlY2sgZm9yIGltc2lj
X3N0YXRlIGJlZm9yZSBkZXJlZmVyZW5jaW5nIGl0IGluCj4ga3ZtX3Jpc2N2X2FpYV9pbXNpY19o
YXNfYXR0cigpLiBXaGlsZSB0aGUgZnVuY3Rpb24gY2hlY2tzIHRoYXQgdGhlCj4gdmNwdSBleGlz
dHMsIGl0IGRvZXNuJ3QgdmVyaWZ5IHRoYXQgdGhlIHZjcHUncyBpbXNpY19zdGF0ZSBoYXMgYmVl
bgo+IGluaXRpYWxpemVkLCBsZWFkaW5nIHRvIGEgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIHdo
ZW4gYWNjZXNzZWQuCj4KPiBUaGlzIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIGR1cmluZyBmdXp6aW5n
IG9mIFJJU0MtViBLVk0gY29kZS4gVGhlCj4gY3Jhc2ggb2NjdXJzIHdoZW4gdXNlcnNwYWNlIGNh
bGxzIEtWTV9IQVNfREVWSUNFX0FUVFIgaW9jdGwgb24gYW4KPiBBSUEgSU1TSUMgZGV2aWNlIGJl
Zm9yZSB0aGUgSU1TSUMgc3RhdGUgaGFzIGJlZW4gZnVsbHkgaW5pdGlhbGl6ZWQKPiBmb3IgYSB2
Y3B1Lgo+Cj4gVGhlIGNyYXNoIG1hbmlmZXN0cyBhczoKPiAgIFVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcwo+ICAgZGZmZmZmZmYwMDAwMDAw
MQo+ICAgLi4uCj4gICBlcGMgOiBrdm1fcmlzY3ZfYWlhX2ltc2ljX2hhc19hdHRyKzB4NDY0LzB4
NTBlCj4gICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo5OTgKPiAgIC4uLgo+ICAga3ZtX3Jp
c2N2X2FpYV9pbXNpY19oYXNfYXR0cisweDQ2NC8weDUwZSBhcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYzo5OTgKPiAgIGFpYV9oYXNfYXR0cisweDEyOC8weDJiYyBhcmNoL3Jpc2N2L2t2bS9haWFf
ZGV2aWNlLmM6NDcxCj4gICBrdm1fZGV2aWNlX2lvY3RsX2F0dHIgdmlydC9rdm0va3ZtX21haW4u
Yzo0NzIyIFtpbmxpbmVdCj4gICBrdm1fZGV2aWNlX2lvY3RsKzB4Mjk2LzB4Mzc0IHZpcnQva3Zt
L2t2bV9tYWluLmM6NDczOQo+ICAgLi4uCj4KPiBUaGUgZml4IGFkZHMgYSBjaGVjayB0byByZXR1
cm4gLUVOT0RFViBpZiBpbXNpY19zdGF0ZSBpcyBOVUxMLCB3aGljaAo+IGlzIGNvbnNpc3RlbnQg
d2l0aCBvdGhlciBlcnJvciBoYW5kbGluZyBpbiB0aGUgZnVuY3Rpb24gYW5kIHByZXZlbnRzCj4g
dGhlIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZS4KPgo+IEZpeGVzOiA1NDYzMDkxYTUxY2YgKCJS
SVNDLVY6IEtWTTogRXhwb3NlIElNU0lDIHJlZ2lzdGVycyBhcyBhdHRyaWJ1dGVzIG9mIEFJQSBp
cnFjaGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5h
Yy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+
CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpR
dWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4yMAoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiBW
MyAtPiBWNDogRml4IHR5cG8gaW4gU2lnbmVkLW9mZi1ieSBlbWFpbCBhZGRyZXNzLgo+IFYyIC0+
IFYzOiBNb3ZlZCBpc2VsIGFzc2lnbm1lbnQgYWZ0ZXIgaW1zaWNfc3RhdGUgTlVMTCBjaGVjay4K
PiAgICAgICAgICAgUGxhY2VkIHBhdGNoIHZlcnNpb24gaGlzdG9yeSBhZnRlciAnLS0tJyBzZXBh
cmF0b3IuCj4gICAgICAgICAgIEFkZGVkIHBhcmVudGhlc2VzIHRvIGZ1bmN0aW9uIG5hbWUgaW4g
c3ViamVjdC4KPiBWMSAtPiBWMjogQWRkZWQgRml4ZXMgdGFnIGFuZCBkcm9wIGV4dGVybmFsIGxp
bmsgYXMgc3VnZ2VzdGVkLgo+Cj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgNSArKysr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9h
aWFfaW1zaWMuYwo+IGluZGV4IGU1OTdlODY0OTFjM2IuLmNkMDcwZDgzNjYzYTkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9h
aWFfaW1zaWMuYwo+IEBAIC05OTMsOCArOTkzLDExIEBAIGludCBrdm1fcmlzY3ZfYWlhX2ltc2lj
X2hhc19hdHRyKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlKQo+ICAgICAgICAg
aWYgKCF2Y3B1KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPgo+IC0gICAgICAg
aXNlbCA9IEtWTV9ERVZfUklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAg
aW1zaWMgPSB2Y3B1LT5hcmNoLmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+ICsgICAgICAgaWYg
KCFpbXNpYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICsgICAgICAg
aXNlbCA9IEtWTV9ERVZfUklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAg
cmV0dXJuIGltc2ljX21yaWZfaXNlbF9jaGVjayhpbXNpYy0+bnJfZWl4LCBpc2VsKTsKPiAgfQo+
Cj4gLS0KPiAyLjM0LjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
