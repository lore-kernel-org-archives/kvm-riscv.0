Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77D8C5AC67
	for <kvm-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lb+0V04ilkjSjYz13dXB6611sjF1BTOzMWK1OTaa0II=; b=WznermP2CdOv5G
	xw152VdPjhWP2ZaJ8XGEfDH00OYRabbmaZX2a04MRTfX/Tlfft7RhnxNkyFPJFarxFNJBhU8xa1Lr
	z1qkNG5xa4AaeFvk6IeUrdMCaBTywy2DXFvZnRTtvykZoxXjiUzaLAwVXBEaT/DFJC2b0jSNF9sCS
	v8KtFkz+QfVr45ouapttjcHPtrffCtYuML8C6w0mAY1UYAFI3u6g2cOkln5tau04mGIrvNKg6Z0Go
	h/gBPSdfmCq8ayFsnAclSm8qRl2IcFlK7Xmp9LNaPhbH3tucKFF1XaMS5vz0RLFOv6CioskAaJUo/
	e7vJzh5w4YZYGTq2/Ssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshG7-00000009QBd-23Pp;
	Sat, 08 Aug 2026 13:38:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshG3-00000009QAs-48nk
	for kvm-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 13:38:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47fde295992so314398f8f.0
        for <kvm-riscv@lists.infradead.org>; Sat, 08 Aug 2026 06:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786196318; cv=none;
        d=google.com; s=arc-20260327;
        b=a5W571law8Jj9UvKJVIxhBjAHyy+CLZNZlJtjsknAjzc91SeGgCQiRonAK4PVHczVM
         RQqXgEJG7VgNKE/usbRoc5qUr9uh3I7kw8UtezBGOGVy79c+FjnmIJDR0Fitnqvl59JN
         4pn6U8ot4FJML5yyLAoeuetuSkPjEeDkkKzO7mZ6hn4W/wnofD7npLagOLayZGI6IW/k
         Vso8yxtyaddXnv10ZWRoOuihcEldb1NrPr8CfzbZMhfldVT/Ii5+HkCSYzENPF023IrZ
         Z6Gu9YXKLb88r7CEQRiA76VuBCSQ+CWZ0YnL7fuZpFdDKGzuv5kKPOGggRHMvHyqGurx
         aKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LfZyWZCjJ1leqVfT0SG7I+7umcPy1TcL4EPeJOs9ZU8=;
        fh=JUfuJpedr9DPyZUXVnuDPtmJhk14VVTfWTK4f9hdrcI=;
        b=ig6mlAs7a/7O9gGt7ON4dCbMARMvevBCpvXRz9jeBcOWfY0DpTxMXkm3RXipqJ+Eng
         4/C8n4vGSiBAv94xnR7RTJTMqoxEpydGsq2CmPb+gEHFSADuM0ZDFZIi0DRcu5d8AQMB
         o3r7hYyKjpebYVkRs/S6BEshXOb+ezaDBfPkcYMbOdXY57OC2jAprsK3mz78SXoDYbLf
         Kq1D0hroZoGI1T/5AR6/mSsUwIWAjJcxKqrRIdkpD3uSU5VWvlOB79Jm/q2FFCBZSivK
         VElG7objhelCzBAjRpZebj9CSlTZgh1Z6030mvzDzaXvVIiWCeT1ULz9brmsHJAPNV4t
         hy5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786196318; x=1786801118; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LfZyWZCjJ1leqVfT0SG7I+7umcPy1TcL4EPeJOs9ZU8=;
        b=kfE2n6Xc/jkhz3e2V6M2MBVFyraqojO+eI0QsvO9jbPYOnF7yhkF6tQlFhsPPU5wAh
         Gi01ath/HGpLFr0J7MeyeuktIkbMlVNZSMhveU7N3XR57jUF8ETghDXwHuqXr9vN4FoD
         IwltY/eoaX0d3h/amFXRp4Bf8k6OOJBEmjh7I90zoIRHkvejjKk4blEztf9dcNZX46TM
         XxO4UrhpgKx3ZuDw8s3C2z+zraZx8TWu6c3TnzuPY4acJSpkA/eekLauqNi/jVVKxBU2
         55pbof8JFb+QdkUA6GNBPVUcBvMp/NkXxtrCzbeBjYvrvUw0nwqBGy+8I0wd8JDmXbTl
         vOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786196318; x=1786801118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfZyWZCjJ1leqVfT0SG7I+7umcPy1TcL4EPeJOs9ZU8=;
        b=HCkGnbjYU8R/2AoPLMklh/b7nzPeCNE1dZw1+uwVcfw3aboHfoEhGR0PQ1bCno7QC0
         44w7sV3M0f5fN9RInzeTz4EMsJAccKMgH3ome0cSvtXt9Cv9tAIa3cQFkz+9OFKIr/qz
         i5YMvDJ94/0YQMR7ikG57U82eHO+ItA2XtNJQk61t43vGtvkKbcbkZI833ROeceMT4Zn
         4NexLeuNUUAP0TMROlJCxKhlbRxmxkj5CsxfEEseAKvS5oy/keayjVAzXNn9UGLxgcSZ
         87VoYe2KvdzubayeE8r6V8mG+SCumIdDYNMyKoamZNXeJuptu58dAkZryjVbRvW3ppzA
         IeUg==
X-Forwarded-Encrypted: i=1; AHgh+RqzJI/8HNAbvPSt20BCE3lYN6IusG1jY3SytPITREEolR+pmpXL2mdXYLIjvql4yoaaZjHYFxrpW1I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrvvGCx7miSAgHv6OM+Omd0h5GfDtzLiRKEt53mQlgiKM5kyii
	X2EeCO3ap3dEqR9P+GAFXpSwByXoSipDhqnsW4bOot8mr4Os3OOcX9RJQny7vbZe7kWfCVlrYmu
	AxDVVg/diIEg5YkYQwGlNdaUyntNWX0ePuhdQBjMzEg==
X-Gm-Gg: AR+sD13ZpV6V5mGEThfOg/zbKvkY6JP4clYPTAdR6ST+nTjt9n5YFBCLWAMDhlC+U6R
	PMNd1yrCkxCJdTPWvpUcWq5yJU9eZe6p5cyW0roxIJPbs7hKN8U1D0iVF9u2oYLdhIEZznOx1jS
	3nTW8B7Y2InKVLnntX9rFw/ezytc8zK8/4wh4lRuLgY066SgF3kpYWTPlU7gW7R62fAVjXYps9G
	s7T/qwFwEzI9DVl60kFNFFH2JZPhRfeYj2qjvL5SqTIupf89WYMRqVCXGzKbeaNlDuDzHPw3Wa+
	ayZE32b6GIgGpDRV39o6IewTKeu0seIZCF+WAMAMUtuR6CNlp49asG1JcP3SD7/yJRBT1Q4FIOh
	vRmFG2VfPFHWjr1Ud4/rSjW0uubPw4SRT8QqrUZOvIuAS+8IOmBUqzQPKmSz+R3s=
X-Received: by 2002:a05:6000:1887:b0:47f:ec53:1d2d with SMTP id
 ffacd0b85a97d-481319549ddmr7552590f8f.7.1786196318049; Sat, 08 Aug 2026
 06:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260721073612.137259-1-xb@ultrarisc.com>
In-Reply-To: <20260721073612.137259-1-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 8 Aug 2026 19:08:26 +0530
X-Gm-Features: AUfX_mzyJKN77fdCLGM6gmkcr4GuDsVCUAGD0eNJkavB7H9aI1HM5JR4BzibWXc
Message-ID: <CAAhSdy3kDmRxcT_+dOpcUVAkvZ-F0kWdQett+mTy93gPDkwS+Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
To: Xie Bo <xb@ultrarisc.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_063840_065582_CC57E5C9 
X-CRM114-Status: GOOD (  16.86  )
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgMTowNuKAr1BNIFhpZSBCbyA8eGJAdWx0cmFyaXNjLmNv
bT4gd3JvdGU6Cj4KPiBLVk0gZGV2aWNlIGlvY3RscyBhcmUgbm90IHNlcmlhbGl6ZWQgYWdhaW5z
dCBLVk1fUlVOLiBBcyBhIHJlc3VsdCwKPiBrdm1fcmlzY3ZfYWlhX2ltc2ljX3J3X2F0dHIoKSBj
YW4gc25hcHNob3QgdGhlIHBoeXNpY2FsIENQVSBhbmQgSEdFSSBvZgo+IGFuIElNU0lDIFZTLWZp
bGUgYmVmb3JlIGEgY29uY3VycmVudCB2Q1BVIG1pZ3JhdGlvbiByZWxlYXNlcyBpdC4KPgo+IFRo
ZSBIR0VJIGNhbiB0aGVuIGJlIGFsbG9jYXRlZCB0byBhbm90aGVyIHZDUFUgYmVmb3JlIGltc2lj
X3ZzZmlsZV9ydygpCj4gdXNlcyB0aGUgc3RhbGUgdHVwbGUuIEEgR0VUIG9yIFNFVCBhdHRyaWJ1
dGUgbWF5IGNvbnNlcXVlbnRseSBhY2Nlc3MgdGhlCj4gbmV3IG93bmVyJ3MgaW50ZXJydXB0IGZp
bGUuCj4KPiBTZXJpYWxpemUgdGhlIGVudGlyZSBJTVNJQyBhdHRyaWJ1dGUgb3BlcmF0aW9uIHdp
dGggdGhlIHRhcmdldCB2Q1BVCj4gbXV0ZXguIFRoaXMgcHJldmVudHMgdGhlIFZTLWZpbGUgZnJv
bSBiZWluZyBtaWdyYXRlZCBhbmQgcmVjeWNsZWQgdW50aWwKPiB0aGUgYXR0cmlidXRlIGFjY2Vz
cyBjb21wbGV0ZXMuCj4KPiBGaXhlczogZGI4YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBp
bi1rZXJuZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFhpZSBCbyA8eGJAdWx0cmFyaXNjLmNvbT4KClBs
ZWFzZSBhZGRyZXNzIHRoZSBuZXcgaXNzdWUgcmVwb3J0ZWQgYnkgU2FzaGlrbyBib3QKClJlZ2Fy
ZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgMTAgKysrKysr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9r
dm0vYWlhX2ltc2ljLmMKPiBpbmRleCBkMzhmNWRlMDguLjJhNGY4OGVmZSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9p
bXNpYy5jCj4gQEAgLTk2OSw5ICs5NjksMTMgQEAgaW50IGt2bV9yaXNjdl9haWFfaW1zaWNfcndf
YXR0cihzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgIGlmICgh
dmNwdSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4KPiArICAgICAgIG11dGV4
X2xvY2soJnZjcHUtPm11dGV4KTsKPiArCj4gICAgICAgICBpbXNpYyA9IHZjcHUtPmFyY2guYWlh
X2NvbnRleHQuaW1zaWNfc3RhdGU7Cj4gLSAgICAgICBpZiAoIWltc2ljKQo+IC0gICAgICAgICAg
ICAgICByZXR1cm4gLUVOT0RFVjsKPiArICAgICAgIGlmICghaW1zaWMpIHsKPiArICAgICAgICAg
ICAgICAgcmMgPSAtRU5PREVWOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7Cj4g
KyAgICAgICB9Cj4gICAgICAgICBpc2VsID0gS1ZNX0RFVl9SSVNDVl9BSUFfSU1TSUNfR0VUX0lT
RUwodHlwZSk7Cj4KPiAgICAgICAgIHJlYWRfbG9ja19pcnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xv
Y2ssIGZsYWdzKTsKPiBAQCAtOTk1LDYgKzk5OSw4IEBAIGludCBrdm1fcmlzY3ZfYWlhX2ltc2lj
X3J3X2F0dHIoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIHR5cGUsCj4gICAgICAgICAg
ICAgICAgIHJjID0gaW1zaWNfdnNmaWxlX3J3KHZzZmlsZV9oZ2VpLCB2c2ZpbGVfY3B1LCBpbXNp
Yy0+bnJfZWl4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpc2VsLCB3
cml0ZSwgdmFsKTsKPgo+ICtvdXRfdW5sb2NrOgo+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZ2Y3B1
LT5tdXRleCk7Cj4gICAgICAgICByZXR1cm4gcmM7Cj4gIH0KPgo+IC0tCj4gMi41NC4wCj4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
