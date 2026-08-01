Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D44AC5516F
	for <kvm-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKKpCVEUPXKKZnT6fj7hTxn2G9xln1Vm7L2P7R31SYw=; b=hySnrLuWtDh1Vy
	8laZYh8WfIAMqCs4C7EXmTN90V3bolpCfqFKnmooSdx9D9xnCBKjeI2g90jaV88q3rWlBCy0/ePcv
	Vk9pWhTIDM8UD3szTknouNzLPrX0g81A8W99Ivj9hI3S9MR2nsBOTUOtCYDGUA5EYdNhG838WkKUU
	vI2L2V4TKTZmQ94yzSL9fPU1mAGvKpRFUGriWHiyiWyyaPG06nBARDjgvYSgViHbLIxDXfgaay9nm
	5MqgHibIAd4j+7oveY2Q6BkJjFJlMbPiY4e6lqDvWNpTiVXbq6EcmnXr6JJ/7haRUQbN/rOJOXEaO
	t6WvVimsayrLqsG17hBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5C6-0000000E3Zg-4AcG;
	Sat, 01 Aug 2026 08:35:46 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5C3-0000000E3Xz-3AsX
	for kvm-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:35:45 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so17120811fa.1
        for <kvm-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785573341; cv=none;
        d=google.com; s=arc-20260327;
        b=RzL2Op60LB0vXJKI8cmZ4IChb1x2AEWzaz+/+ZxGNkG3f9ZCvoteFTX3eHpxVZhlud
         rN7frg99By0zdRd/XQXcrFHrhRZZmCZePPqqqqKxuOnS4hKV4NpUXHAGvtu4eR+/Yf/Z
         HbdtYYJ8V1fYkor8fH1txkisCPoN2/vR/1oHiuufj8qP/2jSsor3TgQ50i1fsCL1P33E
         RPKlFMhQBGSwMqQrbuJYkeOtvWx3kqG4EQEu7qD8FmVUjF6J4QU1JA8cRD23U3/1MQyS
         6ZwZV1HJkwkNOFG3jX7Y2Phe8ZaRHRB3InKS32Uk/r8b06DM2OqSM9bgUVtVJX8Xlsgo
         dJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ti7qy/Wgg1UvAG+vuSmd4Pnu4gP//7qkOjMeXPRouA8=;
        fh=7sHWYa6exGV+I9LhJj8s5Od3N/OozAepqYoYy3Fdsb8=;
        b=naMdhvRyCI3u8MfKfGyeu50iQdyYV4irvXzCfbQBfff7vs2inppf01I8vHZ88qCRoK
         xHW1weNcv95mtuJaPoAp98UWz4fSAJeRsrJAsha4CiT0QKVfdiNp/2xiT3vudvqrw5k7
         oY3DFbAqTp7c8LbhYfMLAOGM7efDLu+vWqM3795ckjVsHKYlG6Kj6w2AGTsVOHkM6srH
         zsHsVvZn3oh/0vzUcO9R9lRrn0L57t2XR3QFtSeR+s7rofF9UlQIEHv9B1KYjXPxS5AH
         FAMSgiV94Zo+hjZyGKCSE5x46Wi9nx9TXffOFKOGgGCsIWfgancrLdZZGPJD+qy/PfBF
         j2lw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785573341; x=1786178141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ti7qy/Wgg1UvAG+vuSmd4Pnu4gP//7qkOjMeXPRouA8=;
        b=s//QP9lEXfPfrF30LNUGj7hwyYsY/8xkrs+v1NnaLH+DFmBaoydaxNqENYyq/fOA2b
         EUoOtIylZhxJaqM4QVbzU+6Zq7vcFLwzLHBODYDUPFTNpPm29ezMlWunqXjSpMszEH+p
         5Io0Oe9Kqxg32ziDBa7oSeTZL7HZ8Zgwsc7IWyBbds54mTlZWtfzOhTs0wLkQNE3a+Nj
         QX/GGVrHjCAu16zPg9yWbUDE9P3M+AUDkEwqd1aimVlTyzR82q6lVqLhExI/KOcEU3lG
         2Cco9VJBpX5GpxnJWZsNsrYhOih1J1NGLKnmg7zs7KCzItbWjwYwNm44zLCxFNMJBmbp
         l4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785573341; x=1786178141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ti7qy/Wgg1UvAG+vuSmd4Pnu4gP//7qkOjMeXPRouA8=;
        b=b+LAqJ8ZU+UJkNJX6x2gC6v0Ga08ZshlQJiAh06VVm4X7fAystV3WrYmaWxrzrGCgp
         2t/pS8o41+UA5ql/68TxJTikxfEuTbP8euZv2MlP/xbtO7vhD5RGUV4hBz55Fp8H5fn+
         d5iAJn2s3nDRwUFXLSbAs48nHCCK/9R0MZv8yiQ6PeIOYI8AMFzky2rl7dQ++v7c6+8a
         CrZZ5uK4GUT8JdCTscrAXUI5cJnTJndS9+BC2ec7iFZ5MJlinfEkniBL1QQSCpmpaIrw
         oknsnqOYuqP0Q4KF9blTguK90uW0Qul1mtlyjjlxMzndpFLS2ZhrgkjTSeLMtKvXZolj
         TDNg==
X-Forwarded-Encrypted: i=1; AHgh+RrDb+SZ3nu8vTTIK7WoDXhunylnaYTLQrgQi068AKKpKQZqDUc3awhEADgyjjOqkNgQDzhXPuXc+RE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx09XyrXT//BSa1U0HgashsBhXErxGh57+M8mFhXgE5X7PZnHCo
	HhDyxkouL2MmbuosX9GVIa18u3k12LhtBETbAuyZMgv24IUA9KmuVSQIqTa7U0na6+PQ50V+uBY
	mbTS/WsR9yzJw5MT8Hu/LJo/KntoE4FueXNxqEKJOog==
X-Gm-Gg: AR+sD11BIDa6E1z0ivaks+PyPwNmixzLMGi8HKB0e1iTJAMv2uBg0wvNWtZ/fs+qe+Y
	1UCrwiPfj5MMId6mRfUaCu0QlgZYwwmt5BbuM3vmyHctdV1ubcW8zP6aLZx+MJ+JaCzvbJs4MGY
	Mox+pqp3+ODqPRpxNpjyMd7tfzkCkiNj/iVol2Cp8sLnSGjz3FFLwfIxEzT+Wi6Ple8nOqlDKpO
	U3unkrA3a5Z2bSUWDwism5fLZV2tO9dHmBCPCmbe6D5W1cK0G6dOnxsF59ehd4IDlXUD9b7OG+B
	kUzNv4JxacWKJG6DjYwh0J7IkkpfSDkMsPys+5QXwIAfZKAaNlUYvSuOxGLvBh6/mSDeGQo1mmc
	KuAKEHvd0sAv1kl78xyLvzCTsRIPKzadMfQ6w4ZGHQINbqZ6TAg2/Ll72kPgSaW7t
X-Received: by 2002:a05:6512:6884:10b0:5b0:12cf:ae28 with SMTP id
 2adb3069b0e04-5b2e4f6d20bmr309861e87.34.1785573341398; Sat, 01 Aug 2026
 01:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260731091215.1549430-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731091215.1549430-1-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:05:29 +0530
X-Gm-Features: AUfX_mz53XbCAJ1CS-mX5hYkoLEkQs_MWRVhje-M7z7-nmkWZgGhs1bk87PQqdM
Message-ID: <CAAhSdy15rQDkLVncPmdQ3+tKyFXv6HiuUe1=xKCG+Q1rzBOqVA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Implement Eager Page Splitting for RISC-V
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_013543_831176_11DE085B 
X-CRM114-Status: GOOD (  21.48  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMjo0NeKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IEVhZ2VyIFBhZ2UgU3BsaXR0aW5nIGlzIGltcGxl
bWVudGVkIG9uIHg4NiBhbmQgQVJNLiBJdCBpbXByb3ZlcyB0aGUKPiBwZXJmb3JtYW5jZSBvZiBk
aXJ0eSBsb2dnaW5nICh1c2VkIGluIGxpdmUgbWlncmF0aW9ucykgd2hlbiBndWVzdCBtZW1vcnkK
PiBpcyBiYWNrZWQgYnkgaHVnZSBwYWdlcy4KPgo+IFRoaXMgc2VyaWVzIGltcGxlbWVudCBFYWdl
ciBQYWdlIFNwbGl0dGluZyBmb3IgUklTQy1WLiBUaGUgSW1wbGVtZW50YXRpb24KPiBzaW1pbGFy
IHRvIHg4NiBhbmQgQVJNLiBJdCBwcm92aWRlcyB0d28gd2F5cyB0byBzcGxpdCBodWdlIHBhZ2Vz
IGluIGlvY3RsCj4gY29udGV4dCBpbnN0ZWFkIG9mIG9uIGZhdWx0IGluIHZDUFUgY29udGV4dDoK
Pgo+IC0gU3BsaXQgaHVnZSBwYWdlcyB3aGVuIGRpcnR5IGxvZ2dpbmcgaXMgZW5hYmxlZCB3aGVu
Cj4gICBLVk1fRElSVFlfTE9HX0lOSVRJQUxMWV9TRVQgaXMgbm90IHNldC4gVGhpcyBoYXBwZW5z
IHdoZW4gZW5hYmxpbmcgdGhlCj4gICBLVk1fTUVNX0xPR19ESVJUWV9QQUdFUyBmbGFnIG9mIGEg
bWVtc2xvdCwgYW5kIHNwbGl0cyB0aGUgd2hvbGUgbWVtc2xvdAo+ICAgaW50byA0SyBtYXBwaW5n
cy4KPgo+IC0gU3BsaXQgaHVnZSBwYWdlcyBkdXJpbmcgS1ZNX0NMRUFSX0RJUlRZX0xPRyB3aGVu
Cj4gICBLVk1fRElSVFlfTE9HX0lOSVRJQUxMWV9TRVQgaXMgc2V0LiBUaGlzIGhhcHBlbnMgd2hl
biBlbmFibGluZyBkaXJ0eSBsb2cKPiAgIGluIHNtYWxsIGNodW5rcy4gSXQgZG9lcyBub3Qgc3Bs
aXQgdGhlIHdob2xlIG1lbXNsb3QsIGJ1dCBvbmx5IHRoZQo+ICAgcmVxdWVzdGVkIGNodW5rIHJh
bmdlLgo+Cj4gQ2hhbmdlcyBpbiB2NToKPiAgLSBQQVRDSDE6IE1vdmUgcGdkX3NwbGl0X3BhZ2Vf
Y2FjaGUgZnJlZWluZyB0byBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKCkuCj4gIC0gUEFUQ0gzOiBB
ZGQgYSBjb21tZW50IHRvIGV4cGxhaW4gd2h5IFRMQiBmbHVzaCBpcyBub3QgbmVlZGVkIGhlcmUu
Cj4gIC0gTGluayB0byB2NDoKPiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3Yv
MjAyNjA3MDExMjA5NTQuMTI5ODczLTEtd2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbi8KPgo+IENo
YW5nZXMgaW4gdjQ6Cj4gIC0gUmViYXNlIG9uIHY3LjItcmMxIHZlcnNpb24uCj4gIHNhc2hpa28t
Ym90IEFJIHJldmlldwo+ICAoaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjI0
MTYwMDU0NDYzd2NEdkphTW95ZFNnZ2NOT1dnY2ZCQHp0ZS5jb20uY24pCj4gIC0gQWRkIHRoZSBy
d2xvY2tfbmVlZGJyZWFrKCkgY2hlY2sgd2hlbiB0b3VwIHNwbGl0IGNhY2hlLgo+ICAtIEFMSUdO
X0RPV04gdGhlIHN0YXJ0IGFkZHIgdG8gUE1EX1NJWkUuCj4KPiBDaGFuZ2VzIGluIHYzIHJlc2Vu
ZDoKPiAgLSBGaXggcGF0Y2ggZm9ybWF0IHRvIGVuc3VyZSBlbWFpbHMgcmVhY2ggdGhlIGxpbnV4
LXJpc2N2IGFuZCBrdm0tcmlzY3YKPiAgICBtYWlsaW5nIGxpc3RzLgo+ICAtIE1vdmUgdGhlIGZy
ZWUgcGdkX3NwbGl0X3BhZ2VfY2FjaGUgaW50byBrdm1fYXJjaF9kZXN0cm95X3ZtKCkuCj4gIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8yMDI2MDYyNDE2MDA1NDQ2M3djRHZKYU1v
eWRTZ2djTk9XZ2NmQkB6dGUuY29tLmNuLwo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAgLSBSZWJhc2Ug
b24gdjcuMSB2ZXJzaW9uLgo+ICAtIEFkZCBwYXRjaDAzIHRvIHJlbW92ZSB0aGUgcmVkdW5kYW50
IFRMQiBmbHVzaCBvcGVyYXRpb25zLgo+Cj4gIHNhc2hpa28tYm90IEFJIHJldmlldwo+ICAoaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL21lc3NhZ2UvMjAyNjA2MDMxMDQ4NDcuOTY5MkMxRjAwODkzJTQw
c210cC5rZXJuZWwub3JnKQo+ICAtIENoZWNrIHRoZSBrdm0tPmFyY2gucGdkIGJlZm9yZSBzcGxp
dCBodWdlIHBhZ2VzLgo+ICAtIEFsaWduIHRoZSBzdGFydCBhZGRyZXNzIHRvIFBNRF9TSVpFIGJl
Zm9yZSBzcGxpdC4KPiAgLSBGbHVzaGluZyByZW1vdGUgVExCcyBiZWZvcmUgRHJvcHBpbmcgbW11
X2xvY2suCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIFJlbmFtZSB0aGUgc3BsaXRfcGFnZV9jYWNo
ZS4KPiAgLSBSZW5hbWUgdGhlIGt2bV9yaXNjdl9zcGxpdF9odWdlX3BhZ2VzIGFuZAo+ICAgIGt2
bV9yaXNjdl9zcGxpdF9tZW1vcnlfcmVnaW9uLgo+ICAtIEFkZCBsb2NrZGVwX2Fzc2VydF9oZWxk
IGNoZWNrIGJlZm9yZSBzcGxpdCBodWdlIHBhZ2VzLgo+ICAtIFVwZGF0ZSBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dC4KPiAgLSBMaW5rIHRvIHYyCj4gIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwNjAzMTc1MjU2NDA4TDBqbnFH
czFjSkdjMGlqQ2R1amNpQHp0ZS5jb20uY24vCj4KPiAgLSBMaW5rIHRvIHYxOgo+ICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDUxMzE1MzY1Njg0N2wzYzRmSTVoQnNB
eW9JWmk4YUdJc0B6dGUuY29tLmNuLwo+Cj4gV2FuZyBZZWNoYW8gKDUpOgo+ICAgUklTQy1WOiBL
Vk06IEFkZCB0aGUgc3BsaXQgcGFnZSBjYWNoZSBmb3IgaW9jdGwgY29udGV4dAo+ICAgUklTQy1W
OiBLVk06IFNwbGl0IGh1Z2UgcGFnZXMgd2hlbiBkaXJ0eSBsb2dnaW5nIGlzIGVuYWJsZWQKPiAg
IFJJU0MtVjogS1ZNOiBSZW1vdmUgcmVkdW5kYW50IFRMQiBmbHVzaCBvcGVyYXRpb25zCj4gICBS
SVNDLVY6IEtWTTogU3BsaXQgaHVnZSBwYWdlcyBkdXJpbmcgS1ZNX0NMRUFSX0RJUlRZX0xPRwo+
ICAgUklTQy1WOiBLVk06IEFkZCB0aGUgZWFnZXJfcGFnZV9zcGxpdCBtb2R1bGUgcGFyYW1ldGVy
Cj4KPiAgLi4uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAgIHwgICA3
ICstCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oICAgICAgICAgICB8ICAg
NiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICAgICAgICAgICAgfCAg
IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAgICAgICAgICAgICAgICAgfCAg
MjMgKystLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxMDAgKysrKysrKysrKysrKysrKystCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTIwIGluc2VydGlv
bnMoKyksIDE3IGRlbGV0aW9ucygtKQo+CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTcu
MwoKVGhhbmtzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
