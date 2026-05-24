Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DEBCD4F54
	for <kvm-riscv@archiver.kernel.org>; Sun, 24 May 2026 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Za7nDPn3SLiHFhgx9RnqK3tNvqQ2tSkbr7sbjwp5JB4=; b=EuF52HN3wj636Y
	n8cfrHEVq5oBt2RHuiaEzpA5MTVzcR/RMIfBHSX/On3S7nBm6zA8ZA+Dqzk/0sK3nrpWe+UiJt1tC
	FM32cVTgTG/rB3VAyzTe82bg1Txgtu4LjQVjEhdwgfxmxNzJ0YJCFw87QbVx5xmYrOSNKq4Oiozs3
	tBrl6RfJXOofIXVCTvZIKMfh37eRbaIufKjWjfHy2XRfJyNhLIePGl+pORlB1K+RgLsp26INFOmlx
	M6uE61BnOOSVjWHijeol8WFCLVABKd13EHwvARu/G5YJ23E8NsYfas1DRcoWCa/nWQYP2ZbEo0mOm
	5FLuk2AYfqGbHUOQOVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1Lm-0000000EUgX-0BeN;
	Sun, 24 May 2026 05:26:10 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1Lj-0000000EUfQ-2ptG
	for kvm-riscv@lists.infradead.org;
	Sun, 24 May 2026 05:26:09 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e61e25199bso289035a34.1
        for <kvm-riscv@lists.infradead.org>; Sat, 23 May 2026 22:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779600366; cv=none;
        d=google.com; s=arc-20240605;
        b=gWuDxO54T1uBwMkw5zSASQeIACXT8c8B9/iUWk4/b/jfkdMLzqesa+UPIHYmvq+rOh
         LkV63iHNECuvmGYgeOSK9XxdgJsCwUJWJ7IWjblRVsdYWuu8q++pxf8mVePegSCJTHVr
         kjGZgGFrmX1RFIVC+Vf915Zs60Fd1wTG/hh9lwD8Ng7RWN77X5TIQka2RIgxa9tmyZ0/
         CXWau9lBye4A6M0mK/HqAoOLDsgXClBW43R7t5PdT8oXFk+n6LO1WYOM//cyKOjEkyol
         Yjzl7qjHtxu/57mNj23WR5nDu7gbOTgEW2jJyW3U8BuKxRUBy6R438pNSnjiZuKVJQLR
         AqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eE6+eEhD+C63Fu1K/v95BeKlMaBi30euPUmiLWrnqTo=;
        fh=JT5xXUSXw6FH2bzBaJ45R1yDtSW/JZRx0Up0XSrM4TI=;
        b=ZwqciBw7bvqUdcwcP91BjF9sBCmpWt9LPOUlGUXYuZnOn9l8Xt9dFCzSUM7/U26R1a
         yeCqt5Wfh9mnZ203fo3d62UlvsvzMI9BTIdTA4YSreD/qN/2X0qjR9QBeI01j6SgLith
         2XZbMWYoOwkk9aEi2k3uLHYvUCGMA7yoBfThQDFKvERFxQ8S3hVgmvHlk5y/VNRku3pr
         Y632fHKlDLfaNqom1yK8GBkTey//rqTIsvN4STurj9n4tH7U95o5x80oA2GZFW7TzCTM
         gzqg9gxQCiOkeJbxmCzxr49PLiB9XfOdMLq4jfCVlpnp5LmuktrUUdvHAWqYexKs3mtq
         NbNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779600366; x=1780205166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE6+eEhD+C63Fu1K/v95BeKlMaBi30euPUmiLWrnqTo=;
        b=Kcy+YARBghRSr5JfCVc+54sHnItVN70TtUGy8TPen+LF2OA/PMIWZxX3zd3lN/GDRa
         mXCX1VZ5Cp1MIP28R6j1BnsuJ3kVEEA0Wct2lUd2VHxx40Fk1ixd0ue938FR052tuzea
         LfXaGEx1DTz9/rBGr4pF0vZMRxizIthb63JIChNR0Oyp7LljuVEhOcJjTNsR/Hy7UdWE
         3m2tDFmIds96Ra/Cq84zHH6cXKePLlGObvedOACyoGGPDH7LoD3K2+k9l/CF9JQzjpC2
         t1IwBio1+ji9Qye5qFECwhJ3F/X1uCgvSVr8Mxglg6GOiNwnqWgUo9PKLQN+X+HBlLUs
         jNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779600366; x=1780205166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eE6+eEhD+C63Fu1K/v95BeKlMaBi30euPUmiLWrnqTo=;
        b=FpwpZtg1/tUF9zrlzTmQYqjs2o5ZHraD8l1v9QMyQD7v3cCfGSYCfhVhGWQbiiH+Gk
         LazZGQJP6BoD71CiXv6Rt9wlPRNh4keLLw/wr2eoBv3udZ7tJOf95GtNkGSoWjOZz+Ps
         91M2Yhfcrg5NUmDlFOMevcdIZMicEUmBaa9pbTp11XmMT7o11Zdcna6W0EHzOtMslExj
         qWp5LfmiXA60Q/T2hSFu4sWdQSY/vXx2pmpcJNJJujL4n6YSk+pQGSvdnYDuRkOivUkB
         GKepyykHpOkz3Qmf4ZG5k34VFYivITa6SEXep0fdgtmcVebEDq2qEKnmFrMDo5bPMu40
         wTvg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ah0RXEZdJ1v7aAz8OmyvwXJ/nvvv6B3MdxxRLO4A1edQTsF030A35JDr0xB/Vip53mttBQGgOXOI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9GcEnIdwuG0BaZG6kuFn85JWMPzsY7EyEhrU4zmXNwmZroAhI
	imLVIZ5OwyRicmgts/zL7upMGidwzVSzCjJ+AMKklj6jG6/xlYP4IKBwEZRqYwlvyaOkkMF95LQ
	+uj1N8brChDOJwYz4eAt+e8f6VAyb4bBb4thSsd2G0Q==
X-Gm-Gg: Acq92OGN/HyQu0ob7MoOiiZ7OE/VD2dnp4+N6CA1I53q0s1CshVXZXXk3IcnY6FOEgj
	T+vIHgMLP6N0fBLh7mX9ueuDBa2esv3+y5WKS1swZFFSl6UeCBAIvTrCOXhNf5lzmEQxHsSZJBN
	vgL0BDr5+qn0krTNedwNJtBqld55Ge14lyOc/sYwwmxIeLwdVA2qAONbmi4SlPnt68MjihIZgsB
	whYSmsH1umyLwiwAnagx8AJaAMiOa1to0HJvIRK9B0pkA/vYw83SguhcUoRb/nPSD3QaeQvbmTZ
	4GcsK6pokScH84OaBM6wntN2I8IY1P0DNd/njRg02Ac8bLHY1Dw2FSUx5Ei75bHSNbcdW+lh6Dl
	qyLhh7LTLbNhOawCRwn7Pld6OJIM=
X-Received: by 2002:a05:6820:868b:b0:69b:5f97:de79 with SMTP id
 006d021491bc7-69d7eb91b64mr4064957eaf.19.1779600366573; Sat, 23 May 2026
 22:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org>
In-Reply-To: <20260425005916.3321811-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 May 2026 10:55:55 +0530
X-Gm-Features: AVHnY4JBNFDLe44QojpCNBOQNUnwD6PWyRl75taA_4p2OczkddPd-j2jxpb_QyM
Message-ID: <CAAhSdy3T32AuG=MujHOhjw08h7h8UAyYjkORVNxUgR77Gn1ZWQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] RISC-V: KVM: AIA: Convert HGEI management to fully per-HART
To: guoren@kernel.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, gaohan@iscas.ac.cn, 
	inochiama@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, me@ziyao.cc, 
	palmer@dabbelt.com, pjw@kernel.org, tglx@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_222607_718629_75C68A2E 
X-CRM114-Status: GOOD (  14.63  )
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

T24gU2F0LCBBcHIgMjUsIDIwMjYgYXQgNjoyOeKAr0FNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBUaGlzIHNob3J0IHNlcmllcyBjb252ZXJ0cyBSSVNDLVYgS1ZNIEFJQSdz
IEh5cGVydmlzb3IgR3Vlc3QgRXh0ZXJuYWwKPiBJbnRlcnJ1cHQgKEhHRUkpIGxpbmUgbWFuYWdl
bWVudCBmcm9tIGEgZ2xvYmFsICJvbmUtc2l6ZS1maXRzLWFsbCIKPiBtb2RlbCB0byBhIGZ1bGx5
IHBlci1IQVJUIChwZXItQ1BVKSBtb2RlbC4gSXQgYWxzbyBwZXJmb3JtcyB0aGUKPiBjb3JyZXNw
b25kaW5nIGNsZWFudXAgaW4gdGhlIElNU0lDIGlycWNoaXAgZHJpdmVyLgo+Cj4gVGhlIG1vdGl2
YXRpb24gaXMgdG8gcHJvcGVybHkgc3VwcG9ydCBoZXRlcm9nZW5lb3VzIFJJU0MtViBTb0NzCj4g
KGJpZy5MSVRUTEUsIG11bHRpLXZlbmRvciBjb3JlIG1peGVzKSB3aGVyZSBkaWZmZXJlbnQgSEFS
VHMgbWF5Cj4gZXhwb3NlIGRpZmZlcmVudCBudW1iZXJzIG9mIGd1ZXN0IGludGVycnVwdCBmaWxl
cyAvIEhHRUlFIGJpdHMuCj4gVGhlIG9sZCBnbG9iYWwgYGt2bV9yaXNjdl9haWFfbnJfaGdlaWAg
YW5kCj4gYGltc2ljX2dsb2JhbF9jb25maWc6Om5yX2d1ZXN0X2ZpbGVzYCBhc3N1bXB0aW9ucyBh
cmUgbm8gbG9uZ2VyCj4gdGVuYWJsZSBhbmQgYXJlIHJlbW92ZWQuCj4KPiBBZnRlciB0aGlzIHNl
cmllcywgSEdFSSBhbGxvY2F0aW9uLCBmcmVlaW5nLCBhbmQgaW50ZXJydXB0IGRlbGl2ZXJ5Cj4g
YXJlIGNvbXBsZXRlbHkgcGVyLUhBUlQsIHRoZSBjb2RlIGlzIHNpbXBsZXIgYW5kIGNsZWFyZXIs
IGFuZCB0aGVyZQo+IGFyZSBubyByZW1haW5pbmcgZ2xvYmFsIGFzc3VtcHRpb25zIGFib3V0IGd1
ZXN0IGludGVycnVwdCBmaWxlCj4gY291bnRzLgo+Cj4gQ2hhbmdlbG9nOgo+IFYyOgo+ICAtIEFk
ZCBwZXItSEFSVCBJTVNJQyBndWVzdCBmaWxlcyB0byBjb21wdXRlIGZpbmFsIEhHRUkgY291bnQu
Cj4gIC0gQWRkIG1pbihsb2NhbC0+bnJfZ3Vlc3RfZmlsZXMsIG5yX2d1ZXN0X2ZpbGVzKTsKPgo+
IFYxOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8yMDI2MDQyMTE0NTQ1MS4x
NTk3OTMwLTEtZ3VvcmVuQGtlcm5lbC5vcmcvCj4KPiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNh
ZGVteSkgKDQpOgo+ICAgUklTQy1WOiBLVk06IEFJQTogTWFrZSBIR0VJIG51bWJlciBhbmQgbWFu
YWdlbWVudCBmdWxseSBwZXItQ1BVCj4gICBSSVNDLVY6IEtWTTogQUlBOiBSZXBsYWNlIGdsb2Jh
bCBIR0VJIGNvdW50IHdpdGggc2ltcGxlIGVuYWJsZWQgYm9vbAo+ICAgaXJxY2hpcC9yaXNjdi1p
bXNpYzogTW92ZSBucl9ndWVzdF9maWxlcyB0byBwZXItSEFSVCBsb2NhbCBjb25maWcKPiAgIFJJ
U0MtVjogS1ZNOiBBSUE6IFVzZSBwZXItSEFSVCBJTVNJQyBndWVzdCBmaWxlcyB0byBjb21wdXRl
IGZpbmFsIEhHRUkKPiAgICAgY291bnQKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9h
aWEuaCAgICAgICAgfCAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAg
ICAgICAgfCA2NiArKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYyAgICAgICAgICAgICB8ICA0ICstCj4gIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAg
ICAgICAgICAgICAgICAgICB8ICAzICstCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtc3RhdGUuYyB8IDEwICsrLS0KPiAgaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2lj
LmggICAgIHwgIDYgKy0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMzgg
ZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDMuMAo+CgpJIHdpbGwgc2VuZCBvdXQgdjMgc2VyaWVz
IHRvIGF2b2lkIHNvbWUgYmFjay1uLWZvcnRoLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
