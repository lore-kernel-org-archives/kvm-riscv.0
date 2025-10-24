Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D6ECCD1A5
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 07:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XObUinZPcU4j24AndEHdCXWVfP82a+VVqwB5JGExGDI=; b=2XqjzKieivO6H1
	cWiOLedV48mYYKa0HDyAAKX6A5Q26iuspCRbYnwnkyDH3QZIFFD6xeJkSGnN2Uv4YjWXD/7kLg90e
	pFulFmCZttZpwo8hNxRWDsFeB6KLQPZfXM0u1KwOtglhjvLFhBqx6ufuVHoWojnn+Zq+2gjLxVNAJ
	ln8G31goUHh/s4pDT8Gymb2tDPtLvVhmekjcMzzG8+L/+3TGrxYqGbliQsMEI0e5kqonXDUtfp7Ei
	vX/aAyNyZu3gdq8KooA9ct8uUD5FwBN5zsqVA9aF3WsoGrECNB9rT63f6K3qpz005j4uMpuY8IoSC
	PpGpH/fiii+fRrnxGxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCFT-00000008V0c-3QOA;
	Fri, 24 Oct 2025 07:30:07 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCFQ-00000008UzO-3v8o
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 07:30:06 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-940d327df21so84275639f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761291003; x=1761895803; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeECwYvKn3QP1ga5HQAMgeWC7ylNejyM0v5Sr0Cm2EQ=;
        b=0LIuW3HhuyNcgbsNKbLrmNdA/Ttw00HEcvCI8IC8UM06pcl3kYnFgHuWamaqBkZgB9
         Oef4LfW6uSsLJSy/3NlJ3F0SgDgm+ekv1Mzc6jQoBhxQ1veMMbwNc3XPX2bNdIUWUo/h
         m8sQ8RpCv0qbOc3flz+2qvNNK5KEPdaBO71qtb1fhdy8IS/BFKQXcaSo1NOpPW4BA1/3
         hK8d/H4oeo98LbZIsJef06Bvg4jdHy+J88dVW18BJM8pQAfaZdlaIuWe8Z6SlxV0JD3N
         GjgJxDwi8/ICYaGJ9G2XnkG3GWdnKdOPyhOm9cA7yzd8qbKv6HLja4r67A/6sQ805mrE
         j3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291003; x=1761895803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeECwYvKn3QP1ga5HQAMgeWC7ylNejyM0v5Sr0Cm2EQ=;
        b=PrEHFxQd+zFdDMnxiB7tm35HbNfp6Zyq5N0DDt0r6r5iMffCVkAPfI8sGdrmSHC7KH
         qNeQY2uPu4hDFoI55lFFKmnHk+M/1pgxjLGKR7P1j95wzm7cJwdQ7xAwc2QW0y/0+k3r
         sCU13ZV0SPsEM5i6gHAowVuaPmjzBb1+bdz+gr78SJpeIxvHAfE36FLN5kPfmqphum9n
         scPuqLEGh6LaMS7xn3YSzz0fgPXjV2fJ350jhp2L0yShNc8cWyBKZLmdBBMGcnLrKUJ+
         K0nbGbLlB/l5p0cG8nIennAB3Nqo/nimoBMpUiUiNz9KQof3r/XelqTfX5aCN5tldcnB
         +QNA==
X-Forwarded-Encrypted: i=1; AJvYcCXCdtWTkmMJNcVNlg6GjmKWxj6CqBV4Ysv+LblIU7KTIsCSpcFUoGjcByX1qqVF3WUfkb+WYGcXd+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxC3I8SBWcUGSqQHP0Efh/0WRoHJq0sVp5Ogum92BlD0BOv0uu6
	5m20KFytSKoqQmG+KWN4Ns14JNtJcFQ9c0NYjzQzg5Q8ZDHSs3qzTSVaVXj2tHs8v7YCsMGEKvL
	1LbrqYdVgG4Za6o+j9ZCrbpphBENhQn7+RSq+6e613Q==
X-Gm-Gg: ASbGncvlRN2PJoeA9N9WTnxCMigxNRzZI0gU6HGfJVselVy3FT+Syk0Ruz75sz1tQbt
	GGGJbvnDTBBcWlm2/X1OwZ8d8OxCX6YdTKX1OPohG9SaAx2cpEPz1v+etmgmhTYJXfTJIl0Ea2v
	PadRgdUhsAL8c1wc5bG4+UvHZ2catH0Th8xOzMFZcl8lOaZ1ilmSncOO6OZYAarhwE5HgtzQkyO
	yVh4P0nozZv2OsrUpCVn0CD02fChNKVm8qQc3DF2qfDLbkttz33sNEUX7PJ46XcnhEqa6t5BdK6
	mJwVZrf43UKCzUHyJQ==
X-Google-Smtp-Source: AGHT+IGIrifKfiiRQa/2XZA9cCQCxDOOhKMJD+Ko/sNM4+GGNt9y1f4J0I/KaEUwS5Wnzok7qVC/rqsQNjRaChFrIM0=
X-Received: by 2002:a05:6e02:1947:b0:42d:8bc6:d163 with SMTP id
 e9e14a558f8ab-430c522f3a6mr361200565ab.9.1761291003374; Fri, 24 Oct 2025
 00:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Oct 2025 12:59:51 +0530
X-Gm-Features: AWmQ_blnTdA3IFCP2Lj2bbMBWo7LdsRpDZqjAY90yJsReH08LO8cALRDcjSPJO0
Message-ID: <CAAhSdy1fCCdciZLqmoeWDG_QoOHDi9j0_ZZKYkpGJmWrf14Q-g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	jiangyifei@huawei.com, guoren@kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003005_064368_4BF09520 
X-CRM114-Status: GOOD (  15.30  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgNjozOOKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBBcyBvZiBjb21taXQgYWFjNmRiNzVhOWZjICgidmZpby9wY2k6IFVzZSB1bm1h
cF9tYXBwaW5nX3JhbmdlKCkiKSwKPiB2bV9wZ29mZiBtYXkgbm8gbG9uZ2VyIGd1YXJhbnRlZWQg
dG8gaG9sZCB0aGUgUEZOIGZvciBWTV9QRk5NQVAKPiByZWdpb25zLiBVc2luZyB2bWEtPnZtX3Bn
b2ZmIHRvIGRlcml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+IHByb2R1Y2UgaW5jb3Jy
ZWN0IG1hcHBpbmdzLgo+Cj4gSW5zdGVhZCwgSS9PIG1hcHBpbmdzIGZvciBzdWNoIHJlZ2lvbnMg
Y2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+IGR1cmluZyBnLXN0YWdlIHBhZ2UgZmF1bHRz
LCBtYWtpbmcgdGhlIHVwZnJvbnQgaW9yZW1hcCBpbiB0aGlzIHBhdGgKPiBpcyB1bm5lY2Vzc2Fy
eS4KPgo+IEZpeGVzOiA5ZDA1YzFmZWU4MzcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdl
MiBwYWdlIHRhYmxlIHByb2dyYW1taW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KCkxHVE0uCgpRdWV1ZWQgaXQgYXMgZml4IGZvciBM
aW51eC02LjE4CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCAyMCArLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE5IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNj
di9rdm0vbW11LmMKPiBpbmRleCA1MjVmYjVhMzMwYzAuLjg0YzA0YzhmMDg5MiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4g
QEAgLTE5Nyw4ICsxOTcsNyBAQCBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0
cnVjdCBrdm0gKmt2bSwKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEEgbWVtb3J5IHJlZ2lv
biBjb3VsZCBwb3RlbnRpYWxseSBjb3ZlciBtdWx0aXBsZSBWTUFzLCBhbmQKPiAtICAgICAgICAq
IGFueSBob2xlcyBiZXR3ZWVuIHRoZW0sIHNvIGl0ZXJhdGUgb3ZlciBhbGwgb2YgdGhlbSB0byBm
aW5kCj4gLSAgICAgICAgKiBvdXQgaWYgd2UgY2FuIG1hcCBhbnkgb2YgdGhlbSByaWdodCBub3cu
Cj4gKyAgICAgICAgKiBhbnkgaG9sZXMgYmV0d2VlbiB0aGVtLCBzbyBpdGVyYXRlIG92ZXIgYWxs
IG9mIHRoZW0uCj4gICAgICAgICAgKgo+ICAgICAgICAgICogICAgICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiAgICAgICAgICAqICstLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLSsgICArLS0tLS0tLS0tLS0tLS0tLSsKPiBAQCAtMjI5LDMyICsy
MjgsMTUgQEAgaW50IGt2bV9hcmNoX3ByZXBhcmVfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICpr
dm0sCj4gICAgICAgICAgICAgICAgIHZtX2VuZCA9IG1pbihyZWdfZW5kLCB2bWEtPnZtX2VuZCk7
Cj4KPiAgICAgICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVApIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBncGEgPSBiYXNlX2dwYSArICh2bV9zdGFydCAt
IGh2YSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3QgcGE7Cj4gLQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHBhID0gKHBoeXNfYWRkcl90KXZtYS0+dm1fcGdvZmYgPDwg
UEFHRV9TSElGVDsKPiAtICAgICAgICAgICAgICAgICAgICAgICBwYSArPSB2bV9zdGFydCAtIHZt
YS0+dm1fc3RhcnQ7Cj4gLQo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIElPIHJlZ2lvbiBk
aXJ0eSBwYWdlIGxvZ2dpbmcgbm90IGFsbG93ZWQgKi8KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAobmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+IC0K
PiAtICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfbW11X2lvcmVtYXAoa3Zt
LCBncGEsIHBhLCB2bV9lbmQgLSB2bV9zdGFydCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgd3JpdGFibGUsIGZhbHNlKTsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgaHZhID0gdm1fZW5k
Owo+ICAgICAgICAgfSB3aGlsZSAoaHZhIDwgcmVnX2VuZCk7Cj4KPiAtICAgICAgIGlmIChjaGFu
Z2UgPT0gS1ZNX01SX0ZMQUdTX09OTFkpCj4gLSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+IC0K
PiAtICAgICAgIGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgIGt2bV9yaXNjdl9tbXVfaW91bm1h
cChrdm0sIGJhc2VfZ3BhLCBzaXplKTsKPiAtCj4gIG91dDoKPiAgICAgICAgIG1tYXBfcmVhZF91
bmxvY2soY3VycmVudC0+bW0pOwo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuNTAuMQo+
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
