Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0711FCF65DB
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCZCU6Y/hW0R7BROAeo/iMEss4MTUILCTULbRSN3aHM=; b=puX+rPpnWkQQN8
	oVJl94dEYFCystndKID6pkjXB4Q+idUbSX7FdY1XIUFHgrjzVsUCsh8bkB27DGjZEUR2VjyDgIdHJ
	l2we6FtFj8qkc3YJaAbNz7gNSpfT6Tcvzl3kM+Nqb4vMI4ZZiXUhZ+1Zy/x01EpsTeTtBpj8HfJY6
	xG2GXRSAEYVCr5mMx5K1jN6Eiru+lyMWBGLbmzds/s0p6F82Qn5kEXgLExYB0GfSuLoHtiSLnxm8u
	J18p8MYODn+kVEKFegc1A3a/c0or6FQEn40mCaSRag/aQAir0tRB8gk8I1Pg3GCTVkcZLa5CggEtv
	cWphgeuG5Nc8/V5baq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKEn-0000000CMiq-2BBj;
	Mon, 26 Jan 2026 10:54:29 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKEk-0000000CMi6-2Fqt
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 10:54:27 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-45c78da5936so2870445b6e.1
        for <kvm-riscv@lists.infradead.org>; Mon, 26 Jan 2026 02:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769424865; cv=none;
        d=google.com; s=arc-20240605;
        b=ThMSjYWXZVv5x3DLFE00ac/Ny3aKjeqczc4XlhtFP0Kaz8UwPGQr6qiqw/h8S3cSyM
         TYJgyaSKHesT/kf8KqKJoLPdKyqFRM9aEiUsVdl5zz/AGgizDbgWnEvneVr5+g3CfjUC
         83FLnZ087tP+qTtiPjLWRoGDCfxKNuSNWJui8fAt1GoL1MrUS5xQe6SGdvInvhdqwPay
         I+u0H7wM1h+DQQeAXcyz9Kvq5FpSl0ETuntyWDP+ab2yrcEcvVMD/j8YEmvovMFNT2X5
         UhdcXaAEG/HdNwKg2yXYGTmsVuxu5i6CHbElxC/K3bBMKdZ5oMwvoCwKxQKtatuLaOLx
         ZWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTdfseGGZOBXUDrJx1ZMNK+31Qww06+nWrd3/i+ViQg=;
        fh=VZeJ6mrPhnOHGnldcKlLcbJ0AKZN/VdaFtaTPiOq6hU=;
        b=GrEropOhvrb7AEVbY0FW0Qiz9RhZnkTunURghdc15Xt/puP840LPTwiV/2JvvcWc4p
         +R7ZSo2B7yGDMadfHZn3mAa9nBsD1evsNZ1Jo06kFZnB4ZKGfxx5qbfcpmI99b0zpy1r
         ANeoLA2p25mkk5bbdMkEoqnmSZBfsLGpF7hrGNZFk1EleSwnKjRUQ6ReMz2EyHMJvZIq
         OHeyfQOpo72DbMxF5/JnbEoUv3NoCL7B37rZBBSqtW+DS8FnJL47ajEBOkRkLSNivXpz
         /0Vc3B35Ql985yjDcNQcwYwVw620Rb+X7RN1NCfFhh2mCXnYPZyfWVsmXjlXORWiCKBF
         LsCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769424865; x=1770029665; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTdfseGGZOBXUDrJx1ZMNK+31Qww06+nWrd3/i+ViQg=;
        b=Nlpc5H6w54stJR9JkZtYrbRhplFQDUqtlQDfy+irBCWcE+5QBS8csIKCuQWy2E8Bh2
         v9+C4FZfja160nOI6GHyeCaJ8YD3hC34OP97013+j/ByA7+5lQnA+k4eLdxMDU/N79GN
         y4ZJRUC+TiO9oLgu748tTKywNoNHVF5ycJo0OvyYMkgLRGRJHSjOkyMc3Druhp6GN0wV
         ZK1SzqGYt/4m5A7lx4zOiJcyf7l6MG0srzou+IfDz/hMG6zAzpieVkyrJ3wpSp4xVaEr
         E7pVT3x1gNwZln+A6RraMR6t+9SA+nqNmuhayF9Ka5v0Jy4PorwPpqlCkLpzSgIL7RT7
         lbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424865; x=1770029665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTdfseGGZOBXUDrJx1ZMNK+31Qww06+nWrd3/i+ViQg=;
        b=Ncsr4ogP5sOqAPy0s26/bOUqLqe/4CSDwhXMSOa5tZa8wOKlw3MJPI2t9oon5TTLSi
         VRh0mSTPaIMzuZZ8O+Ri96qKXVyOvzDjMb9RpkEuyqhGgwz8Tz7u1BhNOxGhWbsygNUJ
         5IPtQz7ZMCGpuOVzwLrM7xvPALCj4FfpzrHNWXPlm84TR1gRNR1d/jETzYoegYyJ7+eY
         MdEEXc3ysnW8U1/WBHMIVXtGO13bw7OR58+V8loCSV+5Sj1jQiyUnlZNxCuhAX0WgMgP
         ZNUiz7MhKeJhV5vq9nCU4pVgaSjXq1aSyCPOsl+LpTu/PRZT/iyyIRIz2pnffyHUoSWX
         mPqg==
X-Forwarded-Encrypted: i=1; AJvYcCUp2FfQPcdm8jM7j4rBMEb8qnXlEQqO03TsCyY+s/yNzj3JhE2yrojFRXO5fU5vB3ccE/fzUb2cKhc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7VZgDXvD5MJUr05mqvwllS+3g0NwsquiowelaU+P9Snd134vd
	W06VLPiTeCDPVEH4+z43lk2h99J2WTlg5IU6KelN2V1WDV3EMruTrHcnqQ6A5X2ViU9SZXR0KWR
	oZbw8yLseA+pDd8r+lwfiNabFuZj4d+bhKuqbxQ+WBw==
X-Gm-Gg: AZuq6aKR8+7cnczOyiDW3aHLWcvtDG7vLp1q9IqZXltF39l5YAVsOir0CpLJO3zHeDE
	1/p+plNOh0DoYORz/5ap0xNLVsfRL25jjPH6MqHFgONCcRb+50QtQQ4biZYd1Q57yBVg95F5NHN
	Jz0sxy4JxzfSDHwu5pv7uuWnjNAmo3nOtSKn/QD50K3NcYSF2QL1NOoSYrGCBK3p6plfGR7dnx6
	oiSN1e5j4YXiKiJHmkCdYQx1g5Emoau0faHj1DSEwrfe/7wCfcdhko/uJrsU8dLoznmrYa1i4MW
	n3hSG4Lw5eI3haIdJXBFOZZPcYVVHtCKIP6rbqxSa9AnYVJLeVFVLTZRLBKshKfN0JnE
X-Received: by 2002:a05:6820:985:b0:65f:cda0:e00d with SMTP id
 006d021491bc7-662e0a2ad14mr1878453eaf.17.1769424865038; Mon, 26 Jan 2026
 02:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20260104133457.57742-1-luxu.kernel@bytedance.com>
In-Reply-To: <20260104133457.57742-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jan 2026 16:24:14 +0530
X-Gm-Features: AZwV_QglBY6cl8dy5KVwFFrQ4xZeu7w6ijLW_ze3gtLkx6nEKiZ9nXTtQ7Ab3Ms
Message-ID: <CAAhSdy0krY4ou9TpGV=SKUKPNwgweB58QetUajb3HE5Jfy_RbA@mail.gmail.com>
Subject: Re: [PATCH v5] irqchip/riscv-imsic: Adjust the number of available
 guest irq files
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_025426_874469_E5B94D11 
X-CRM114-Status: GOOD (  25.72  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjA14oCvUE0gWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVk
YW5jZS5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCBLVk0gYXNzdW1lcyB0aGUgbWluaW11bSBv
ZiBpbXBsZW1lbnRlZCBIR0VJRSBiaXRzIGFuZAo+ICJCSVQoZ2MtPmd1ZXN0X2luZGV4X2JpdHMp
IC0gMSIgYXMgdGhlIG51bWJlciBvZiBndWVzdCBmaWxlcyBhdmFpbGFibGUKPiBhY3Jvc3MgYWxs
IENQVXMuIFRoaXMgd2lsbCBub3Qgd29yayB3aGVuIENQVXMgaGF2ZSBkaWZmZXJlbnQgbnVtYmVy
Cj4gb2YgZ3Vlc3QgZmlsZXMgYmVjYXVzZSBLVk0gbWF5IGluY29ycmVjdGx5IGFsbG9jYXRlIGEg
Z3Vlc3QgZmlsZSBvbiBhCj4gQ1BVIHdpdGggZmV3ZXIgZ3Vlc3QgZmlsZXMuCj4KPiBUbyBhZGRy
ZXNzIGFib3ZlLCBkdXJpbmcgaW5pdGlhbGl6YXRpb24sIGNhbGN1bGF0ZSB0aGUgbnVtYmVyIG9m
Cj4gYXZhaWxhYmxlIGd1ZXN0IGludGVycnVwdCBmaWxlcyBhY2NvcmRpbmcgdG8gTU1JTyByZXNv
dXJjZXMgYW5kCj4gY29uc3RyYWluIHRoZSBudW1iZXIgb2YgZ3Vlc3QgaW50ZXJydXB0IGZpbGVz
IHRoYXQgY2FuIGJlIGFsbG9jYXRlZAo+IGJ5IEtWTS4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1
IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgoKUGxlYXNlIGNhcnJ5IFJldmlld2VkLWJ5IGFu
ZCBBY2tlZC1ieSB0YWdzIG9idGFpbmVkIGluIHByZXZpb3VzCnJldmlzaW9ucy4gTmV4dCB0aW1l
LCBJIHdpbGwgbm90IHRha2UgdGhlIHBhdGNoIGlmIHByZXZpb3VzIHRhZ3MgYXJlCm1pc3Npbmcu
CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4yMC4KClJlZ2FyZHMsCkFudXAKCj4gLS0t
Cj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRy
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyB8IDEyICsrKysrKysrKysrLQo+
ICBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCAgICAgfCAgMyArKysKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBpbmRl
eCBkYWQzMTgxODU2NjAwLi5jYWMzYzJiNTFkNzI0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBAQCAtNjMwLDcgKzYzMCw3
IEBAIGludCBrdm1fcmlzY3ZfYWlhX2luaXQodm9pZCkKPiAgICAgICAgICAqLwo+ICAgICAgICAg
aWYgKGdjKQo+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkgPSBtaW4oKHVs
b25nKWt2bV9yaXNjdl9haWFfbnJfaGdlaSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEJJVChnYy0+Z3Vlc3RfaW5kZXhfYml0cykgLSAxKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdjLT5ucl9ndWVzdF9maWxlcyk7
Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9haWFfbnJfaGdlaSA9
IDA7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0
ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gaW5kZXggZGM5
NWFkODU2ZDgwYS4uZThmMjBlZmIwMjhiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLXN0YXRlLmMKPiBAQCAtNzk0LDcgKzc5NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGlt
c2ljX3BhcnNlX2Z3bm9kZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+Cj4gIGludCBf
X2luaXQgaW1zaWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9p
ZCAqb3BhcXVlKQo+ICB7Cj4gLSAgICAgICB1MzIgaSwgaiwgaW5kZXgsIG5yX3BhcmVudF9pcnFz
LCBucl9tbWlvcywgbnJfaGFuZGxlcnMgPSAwOwo+ICsgICAgICAgdTMyIGksIGosIGluZGV4LCBu
cl9wYXJlbnRfaXJxcywgbnJfbW1pb3MsIG5yX2d1ZXN0X2ZpbGVzLCBucl9oYW5kbGVycyA9IDA7
Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyAqZ2xvYmFsOwo+ICAgICAgICAg
c3RydWN0IGltc2ljX2xvY2FsX2NvbmZpZyAqbG9jYWw7Cj4gICAgICAgICB2b2lkIF9faW9tZW0g
KiptbWlvc192YSA9IE5VTEw7Cj4gQEAgLTg4OCw2ICs4ODgsNyBAQCBpbnQgX19pbml0IGltc2lj
X3NldHVwX3N0YXRlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHZvaWQgKm9wYXF1ZSkK
PiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogQ29uZmlndXJlIGhhbmRsZXJzIGZvciB0YXJnZXQg
Q1BVcyAqLwo+ICsgICAgICAgZ2xvYmFsLT5ucl9ndWVzdF9maWxlcyA9IEJJVChnbG9iYWwtPmd1
ZXN0X2luZGV4X2JpdHMpIC0gMTsKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9wYXJlbnRf
aXJxczsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIHJjID0gaW1zaWNfZ2V0X3BhcmVudF9oYXJ0
aWQoZndub2RlLCBpLCAmaGFydGlkKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJjKSB7Cj4gQEAg
LTkyOCw2ICs5MjksMTUgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gICAgICAgICAgICAgICAgIGxvY2Fs
LT5tc2lfcGEgPSBtbWlvc1tpbmRleF0uc3RhcnQgKyByZWxvZmY7Cj4gICAgICAgICAgICAgICAg
IGxvY2FsLT5tc2lfdmEgPSBtbWlvc192YVtpbmRleF0gKyByZWxvZmY7Cj4KPiArICAgICAgICAg
ICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogS1ZNIHVzZXMgZ2xvYmFsLT5ucl9ndWVzdF9m
aWxlcyB0byBkZXRlcm1pbmUgdGhlIGF2YWlsYWJsZSBndWVzdAo+ICsgICAgICAgICAgICAgICAg
KiBpbnRlcnJ1cHQgZmlsZXMgb24gZWFjaCBDUFUuIFRha2UgdGhlIG1pbmltdW0gbnVtYmVyIG9m
IGd1ZXN0Cj4gKyAgICAgICAgICAgICAgICAqIGludGVycnVwdCBmaWxlcyBhY3Jvc3MgYWxsIENQ
VXMgdG8gYXZvaWQgS1ZNIGluY29ycmVjdGx5IGFsbG9jYXRpbmcKPiArICAgICAgICAgICAgICAg
ICogYW4gdW5leGlzdGVkIG9yIHVubWFwcGVkIGd1ZXN0IGludGVycnVwdCBmaWxlIG9uIHNvbWUg
Q1BVcy4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIG5yX2d1ZXN0X2Zp
bGVzID0gKHJlc291cmNlX3NpemUoJm1taW9zW2luZGV4XSkgLSByZWxvZmYpIC8gSU1TSUNfTU1J
T19QQUdFX1NaIC0gMTsKPiArICAgICAgICAgICAgICAgZ2xvYmFsLT5ucl9ndWVzdF9maWxlcyA9
IG1pbihnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzLCBucl9ndWVzdF9maWxlcyk7Cj4gKwo+ICAgICAg
ICAgICAgICAgICBucl9oYW5kbGVycysrOwo+ICAgICAgICAgfQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oIGIvaW5jbHVkZS9saW51eC9pcnFjaGlw
L3Jpc2N2LWltc2ljLmgKPiBpbmRleCA3NDk0OTUyYzU1MTg3Li40M2FlZDUyMzg1MDA4IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiBAQCAtNjksNiArNjksOSBAQCBzdHJ1
Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyB7Cj4gICAgICAgICAvKiBOdW1iZXIgb2YgZ3Vlc3QgaW50
ZXJydXB0IGlkZW50aXRpZXMgKi8KPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBucl9ndWVzdF9pZHM7Cj4KPiArICAgICAgIC8qIE51bWJlciBvZiBndWVz
dCBpbnRlcnJ1cHQgZmlsZXMgcGVyIGNvcmUgKi8KPiArICAgICAgIHUzMiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBucl9ndWVzdF9maWxlczsKPiArCj4gICAgICAgICAvKiBQ
ZXItQ1BVIElNU0lDIGFkZHJlc3NlcyAqLwo+ICAgICAgICAgc3RydWN0IGltc2ljX2xvY2FsX2Nv
bmZpZyBfX3BlcmNwdSAgICAgICpsb2NhbDsKPiAgfTsKPiAtLQo+IDIuMjAuMQo+Cj4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
