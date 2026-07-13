Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAF8C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 05:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/HpgnTuvrXA/lEn5OMRHgd/P72DNqQqh5GUT1v6hjo=; b=xjStnlTMHa/BCl
	aPDXTkrZ7Hmi1tpEzw9X2D0HOAXIWJGBSdF33TpVx9PDaGivkl5z/0rpFaiURPy2QQINsKPmsqAgz
	2ZU48wd/+Sy/OS75eV28Ub+A6wf/nU2e6dFBwQTOySFlC+YdfKYS/wZ+4axk2xJV71hQFLkZFmXxk
	rSfhnWr6tNDyGQGMZL3Psx44G7GEeon7MsPJ1fdlHSRVzxKS6Lt7c3d8fC5m24d1T4hpWob04zQqg
	TVh7Dbvcr1X/U9JsXX2nLPWSvvm9fBeEiK207lU6ZX64JDwdc3Nb39oHFXtHTsMF0tK6UQM624HWr
	KSLxz61Jq5UcRmruPoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj961-000000089Dy-0uNF;
	Mon, 13 Jul 2026 05:20:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj95y-000000089D3-1Itq
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 05:20:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-474560436c3so2060120f8f.0
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 22:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783920044; cv=none;
        d=google.com; s=arc-20260327;
        b=hdLns6QZjYYKFkPE+OQ+lDKVKLNZN2E9LJcgo9i+LNithq2tLKGfXL40Yz9mr7OFOy
         tcJTFoinHd9ycszfsDYVrNqnFQF8FcEg9f/09l8sepWdyEH9MheA+0M81wCG8jv8whJ+
         pSMyRdVC+kJNICfZa+lAvXC4mQLXpP9LvMn0NgGJFxQCInXoNOZmz511NH+uwsjQ6FgI
         zz1oSifZCq+umOkaZwmivohH4wy0xkuFvo7tqkul7OvfkVF7RIm88w6dRdlEiap2euoZ
         h6wrwqj5VyvYZ/bm9qklueOEkY5otwwdreHo5hK1BQ7XCgHkBi+XG0RbEUKb2DN9hjlw
         iCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vtAiO3GAOtWbZl83N5tUcn9I/FK/tuLB8pt/tT+Gqe4=;
        fh=xYfETPbN5EeoMm42YjgqqKJx/OE55PovSiUD81fM9po=;
        b=Fi7MBE1INWWnK0h1QwYNsJR7UmR7dqeNLkIO2WxBCFy+xuc9CMuzrQiJmPkRr8iTgJ
         ULdLboZRqJ5X/GbMqufKUfKTuxywVgr272WCeJay3K9yUuxpl6M1cpiCTXqGSLptz3Hf
         xzve8h+PjOWZND1yb2zLv9I/BmwJ0W09I5bgDJYhfWvfTOD+Rp8bCz229WuCdkQM0rl7
         alcpAKnTu/HykIVcdD5LEiw/1vFQ3pMlEV8J0lUiYTfqI/GqY2aG3qgGphnaphl1sxP9
         1IsZnV+4lShAJE6OAjHo9h9U8rge0K5swYxuFWzkbKRoCFy6QE/Gcc3Z/DYs8i4q7d0B
         QEcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783920044; x=1784524844; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vtAiO3GAOtWbZl83N5tUcn9I/FK/tuLB8pt/tT+Gqe4=;
        b=VXC5kNVbUh9AP4AFS5jleNRaISPVT7yAfkA/UKeOmBaFB756NtAVEg07XWllcWEdQi
         r2LpRFb8fqD/bvzOIBCL18KADPEETY8AxGf7rCOOtPj/7Qi+YmvTO27WnJ9PwYIxxHnt
         ZXR9ZzNfSM65A2GwB3JoeSKUUrFgwo2Bsly1LTFOagIE+WUFS/hAhH+AWoy1HG9vrwNw
         EoapQ8Hi5ZzK01IJGy0xEmeveva6DeKs4Mo6sYXznoy5CMr7NajcFrmjIyuSBqAkA7iR
         /3ndB9I/IvJ8Lh1GaIRgh3BSyNEp/TdoPmfBs8Do6OOWRMA82RTX7XfppvSu5cDF/EGD
         93PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920044; x=1784524844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtAiO3GAOtWbZl83N5tUcn9I/FK/tuLB8pt/tT+Gqe4=;
        b=DGk+xsg5xoZFaJZtklZXHb3aUJDvZUB/w/i/5DTyVXFuo6OBx2/Y7DEyknW7zlHzW2
         V3nZS8Fp6LlKenCviNTbMxLxiby5pWABJVwrdlGGzfnXj1QsWxoqDQRyt4yEFZEJxF/U
         xb0YbLOGryh4LBRl+UcM9mNQQy9DGnvMwjeZ0fW2Q1vbvaD1Zl5M8jnJ48FtfMQmFjJN
         BJRcLQAfkVV7DIQIAzlOWNkkS18uGP/Ux7dLBLpIAqaA42pWg6RQzOA4Xj6himO2djGv
         HthtSVEvUG+cXRiaaeyRZtAnAKSJp3NB8BcLUUyxb2iNi7ClEev+b92O0V8l1aH29pGU
         f41A==
X-Forwarded-Encrypted: i=1; AHgh+RpJ0Qnjly6IOMUEsa1k8CedLbJYU7DRl/aBvQPn5qbGI1tSrwVZpUx1P/KgGWm2xJdTW+zKxd3nqCY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxViZW3SfPzyZoqXXIGw/eYNG7m3QuVP3X3oP2JmA1bGVBqFAeY
	xSmkJCyBELMnTgIrNRAh3D/6dyfxJjAy/LaRMxqC1ASKI7VJv1tE2QCtcjBNQkbw11QrrYjYDmw
	mVfc+ytu1H+PVncmSrxAlVuaI3hPIyrsWyLInixWiKg==
X-Gm-Gg: AfdE7ck7CjtpAkKWV72Edg2Y+1SEQpuZn2L4Q34p/6HUKu2aKCxIMPFRdTsgGJkh3rN
	Qd4AFocD6CGukbCdCuTgWeU8lSDNYIBza3mDlKt70MGZJ/EsXV/9OPlbzTzTKM+S/kF22adAZs/
	44YanSNdQQxtpy/pweIZAZM7TP4x3hHhaLWqktKeQjXbgbp1HJA1Xooww+1JfZuJdmq2IqqXsdZ
	6tIZGXApvnYJiLXH2X3AC7wYR1H4cHQkH0/Fq/frIHNMP6uUuAXRm9g0P+J6/VPVjIPRFvoUI1d
	5r6om8A2il+/B4cwXOzgPGVr6bTznnweRp/9EYbiAt+2oxrRTKeK3Iugo5s621rUt5r+hBQ6Fp/
	uNSixCm5RpmjG/53S
X-Received: by 2002:a05:6000:40cb:b0:47b:5f25:7c59 with SMTP id
 ffacd0b85a97d-47f2dcf8d32mr8542206f8f.38.1783920044394; Sun, 12 Jul 2026
 22:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260610093922.51617-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260610093922.51617-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 10:50:32 +0530
X-Gm-Features: AUfX_mzgLxpjt24Y_crhzgSd_jT-mGHCzGXn6QWlmdDMie4AJ5TBR2ZEqWhokTY
Message-ID: <CAAhSdy220vPtK6a8WpRbmyfN2Aa2wQquJ+p3rLP-P4XOPZOzPQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid redundant page-table allocations in
 ioremap topup
To: fangyu.yu@linux.alibaba.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_222046_364151_19142470 
X-CRM114-Status: GOOD (  19.04  )
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

T24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgMzowOeKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBrdm1fcmlzY3ZfbW11X2lvcmVtYXAoKSBjdXJyZW50bHkgdG9wcyB1cCBpdHMg
b24tc3RhY2sgcGFnZS10YWJsZQo+IGNhY2hlIHZpYSBrdm1fbW11X3RvcHVwX21lbW9yeV9jYWNo
ZSgpLCB3aGljaCBhbGxvY2F0ZXMgdXAgdG8KPiBLVk1fQVJDSF9OUl9PQkpTX1BFUl9NRU1PUllf
Q0FDSEUgKDMyKSBvYmplY3RzIHBlciB0b3B1cC4KPgo+IGlvcmVtYXAgb25seSBjb25zdW1lcyBu
b24tbGVhZiBwYWdlLXRhYmxlIHBhZ2VzLCBhdCBtb3N0Cj4gcGdkX2xldmVscyAtIDEgKDEgdG8g
NCkgcGVyIGNhbGwsIGFuZCBmb3IgY29udGlndW91cyBtYXBwaW5ncwo+IHdpdGhpbiB0aGUgc2Ft
ZSBodWdlIHBhZ2UgdGhlIG5vbi1sZWFmIHBhZ2VzIGFyZSBhbGxvY2F0ZWQgb25jZQo+IGFuZCBy
ZXVzZWQgYnkgc3Vic2VxdWVudCBwYWdlcy4gVG9wcGluZyB1cCB0byAzMiBvYmplY3RzIHRoZXJl
Zm9yZQo+IHRyaWdnZXJzIG1hbnkgdW5uZWNlc3NhcnkgR0ZQX0tFUk5FTF9BQ0NPVU5UIGFsbG9j
YXRpb25zIG9uIGV2ZXJ5Cj4gY2FsbCwgYWxsIG9mIHdoaWNoIGFyZSBmcmVlZCB3aGVuIHRoZSBm
dW5jdGlvbiByZXR1cm5zLiBJbiBob3QKPiBwYXRocyAoc3VjaCBhcyB2Q1BVIG1pZ3JhdGlvbiks
IHRoaXMgY3JlYXRlcyBhdm9pZGFibGUgYWxsb2NhdG9yCj4gY2h1cm4gYW5kIHdhc3RlcyBDUFUg
Y3ljbGVzLgo+Cj4gVXNlIF9fa3ZtX21tdV90b3B1cF9tZW1vcnlfY2FjaGUoKSB3aXRoIGEgY2Fw
YWNpdHkgb2YgcGdkX2xldmVscyBzbwo+IHRoZSBvbi1zdGFjayBjYWNoZSBpcyBzaXplZCB0byB0
aGUgbWF4aW11bSBkZW1hbmQgb2YgYSBzaW5nbGUKPiBtYXBwaW5nLiBUaGlzIHJlbW92ZXMgdGhl
IHJlZHVuZGFudCBhbGxvY2F0aW9ucyBhbmQgcmVkdWNlcyBwZXItY2FsbAo+IG92ZXJoZWFkIHdp
dGhvdXQgY2hhbmdpbmcgYmVoYXZpb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGEgZml4IGZvciBM
aW51eC03LjItcmNYCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5j
IHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0v
bW11LmMKPiBpbmRleCAyZDNkZWYwMjQyNzAuLjg3M2E1ZGRlNGI5MiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTM5
LDYgKzM5LDcgQEAgaW50IGt2bV9yaXNjdl9tbXVfaW9yZW1hcChzdHJ1Y3Qga3ZtICprdm0sIGdw
YV90IGdwYSwgcGh5c19hZGRyX3QgaHBhLAo+ICAgICAgICAgcGdwcm90X3QgcHJvdDsKPiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgcGZuOwo+ICAgICAgICAgcGh5c19hZGRyX3QgYWRkciwgZW5kOwo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyBwZ2RfbGV2ZWxzID0ga3ZtLT5hcmNoLnBnZF9sZXZlbHM7
Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX21tdV9tZW1vcnlfY2FjaGUgcGNhY2hlID0gewo+ICAgICAg
ICAgICAgICAgICAuZ2ZwX2N1c3RvbSA9IChpbl9hdG9taWMpID8gR0ZQX0FUT01JQyB8IF9fR0ZQ
X0FDQ09VTlQgOiAwLAo+ICAgICAgICAgICAgICAgICAuZ2ZwX3plcm8gPSBfX0dGUF9aRVJPLAo+
IEBAIC02MSw3ICs2Miw3IEBAIGludCBrdm1fcmlzY3ZfbW11X2lvcmVtYXAoc3RydWN0IGt2bSAq
a3ZtLCBncGFfdCBncGEsIHBoeXNfYWRkcl90IGhwYSwKPiAgICAgICAgICAgICAgICAgaWYgKCF3
cml0YWJsZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBtYXAucHRlID0gcHRlX3dycHJvdGVj
dChtYXAucHRlKTsKPgo+IC0gICAgICAgICAgICAgICByZXQgPSBrdm1fbW11X3RvcHVwX21lbW9y
eV9jYWNoZSgmcGNhY2hlLCBrdm0tPmFyY2gucGdkX2xldmVscyk7Cj4gKyAgICAgICAgICAgICAg
IHJldCA9IF9fa3ZtX21tdV90b3B1cF9tZW1vcnlfY2FjaGUoJnBjYWNoZSwgcGdkX2xldmVscywg
cGdkX2xldmVscyk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBvdXQ7Cj4KPiAtLQo+IDIuNTAuMQo+CgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
