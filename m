Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC75CD8C8C
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 06:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYIOImct9lNTHpuCPMY4s51laxskl9o/e72q/ugqhjk=; b=0e8TBumyD5DPeZ
	KkODhKgSI7ZUy+DyOGmTkr3Juqg643arn8ME6hmPL6Ok6APehuXStbjXP945smO269E7R4KK1JBm3
	q4X8uEHNUrKhdt4EpMHVwbWn6RIQzMj32/QV0SsRRuKHSAYV3udEyY7IuRJB8FtaPENKVjdJ3ppl0
	N5AsRdlyX+cDtjYnD8wbYMOagDHZtAA9NDeFzQS4ppWYF3lkjKuz2t6j4jOhiedOrv6C88yzwrwUi
	F1GLE8zaOuuqZw1TtlOAsbi6oz2/4hl2SWxE36BhWZY7mu4nZtryvemqszuXSe2Ei6W2J1q9I7WpT
	FAhMaAqiAaVj9TtP4SlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sJ-00000002471-2tpR;
	Sun, 07 Jun 2026 06:20:47 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sF-0000000246E-3TTV
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 06:20:46 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7e71dd64ea2so516011a34.3
        for <kvm-riscv@lists.infradead.org>; Sat, 06 Jun 2026 23:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780813242; cv=none;
        d=google.com; s=arc-20240605;
        b=DDMbLQWOL3XXag9BuyEVWRoLutJwe1jmmQKj7qeR0WVCIGdfvhTrNeMM6hkX27Lp92
         VhKGQ22ShtadCAxNmMhpjgqFdK5FpNwrmR+dv0JVeq2oR5TgsN+Efi4IwwPWP7rD9Orq
         aWqtmjajrnkeokoMBEqhylw4DyLLyz8ePZXXwpfBXvpACIGLxZ0QLBJVroz+SfRuDmle
         WLQqZtfHFmmScWVThH+OxSmpxgsmmkTl+ZAN7d2KpCLEuZmDBlgQUtyhg+NzAcW66Hyg
         ydZbyw7VzNSpdjuUC0RTGrNY7F+zVZi66llBGy/Rt4OGb9s3rX3VHKk8FLnIy/rQpp18
         I7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhujZ4A3wvVpGOkzPEzqlti0wTqzoqDWtQRHQ5CXPug=;
        fh=yhZi0arx+ZXGKMazA8n/16QK+IOL3mrEL14zRV0yR8w=;
        b=BgiFxEYz2Pw2cN3EIIOUeX0ItbUdhK9BmBC/lJM6gd4TiZFa+ZPOSS/wUlmnB/bw9M
         8/AdSPTD6qv5vWVBRXfVwIPzx5ojQWh6vP+vsXOJll5vKSi5JHLVASRHDu8tTMRZEsVb
         fBtCNwdRpnX0LkvpinWCsThqES55cIUbAvqG9EFB5zMU5L/kidmHUBnaFdBEpTtWCuc9
         wzXpwIwKOdmYxxMlMLczcjNlIgKC7bCrqfD966kPIxrurBGZwyakdWlm9npwmZkQJKRa
         ZQ8wKmb5PnSD82x5I+HEnCbLd/2UDpUPDXEKYCK2t7gMdfXvluspMY7MaRlYhG28u7jo
         kM1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780813242; x=1781418042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhujZ4A3wvVpGOkzPEzqlti0wTqzoqDWtQRHQ5CXPug=;
        b=K+sE+rjtnDQpNedG42gHbx45RA6rBnfHNkAZ/CHnNFhDsOEB1u4p5yBHrWXv7t3rqo
         yDmKrp98+o/M6rVYg2crIAFGcJ4uinSCmoxjz5X7IRyoQI31eSI45d0hZRDvH+JTX331
         KPjQKPzcZsYKw0KBxKwIxalxaGbUb2fpzuLeVSIZQK9WMzU8kAvkP3RGSnN6kBAHKew0
         TxNFpzzcmIPhbmyutP2bFo7fxdlqDCTXje/HCcD2bOhjLzulxcy8kx6zkIG4uqWDzbFc
         ipQEmzbGOduNZCxVjGMceihMIjHPX6TiTW96Nmwfqh9eShSXzsvXFue3LZAWX7W5Uzb3
         rsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780813242; x=1781418042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vhujZ4A3wvVpGOkzPEzqlti0wTqzoqDWtQRHQ5CXPug=;
        b=WHqzQKeW98yTojLrHpyalVY4fj6kn6zimfVxJHQlKZ8pD/gjDUzv+c3V6+v5c5ZmiD
         EPau/7780lecCmTtU8Dyukzr8EYr6fBvYanLssKIkt9iPbBG58ROq+ptEm6+XFMoH/dT
         HZu0AIlqTYi1tlaaakFuiaRel/s3aG0n2o+Q11bbZLv79VS3JR4fEWG3PTcRFC0MtDFd
         4lwMdz5yMHqbft76dnvb8vZjT0MtOHBFiX2oB6j6WW8YO23Ah74C7nT2jvUaGsKF86s7
         L9S4MYtZT9BWu87nKoAvFaxI+ueqlkBDBOPsHhKyIdsN2sLVEEn2S4Rij4cc+UCcXVqc
         vlRw==
X-Forwarded-Encrypted: i=1; AFNElJ8VqnRQhVXFb40ABUkGqkxTzfQG4nLttuBDUKnMPdrToi13KY6II19WD+OIDFrdy808uaPs47tiFVs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWwMRpWQRriux2xkYFAd7oMOl67HCjISw64snuco5Ln3gwylL5
	zPo2LnHCdESQfkSf3KCEuIkxHrEPDygv2O3IB8pJPcbxsMdZx6xhlDuyMox4DqWzgKVY4G4JiU7
	TE99sp1kcOGg0BSKPx3XBqREOXsCY7uZ8/RTeRVN4Wg==
X-Gm-Gg: Acq92OHsng4mPAsHBDYAuJY3eulwuKKB4tnnvdiYcFeXBPWCR1MswqENdD2Z0GVVegV
	CKLwp7Vkt9VP8A5zmE1NhBb6SNnLXKcH2GZWJQ50fdi2zMFKR6yHOnvchxmWorrmfJHURBnaA7R
	fKnfUlV1ZpFEFcWiBBPc/8NhaNcJYRaXWrI5P9mtP7y2Ov8KledjsoVkOHI8kKuh1EpiaAwDTTD
	hkoJh1yaKcSBkezqGci7Cuh8ST++Hdw777MDgqjyY+e+NQ5bhpNzuqRpnhqVp/E4er2/L5tkctJ
	6EiI0YlWAoim7Vr/ECrC+EhnwGDLcaghsgIWDdc8a95nMttdXTw8I5SrPHG+LCtCXPq/057XppH
	D2DxjAPq9wFf1NAvGGTTVZ/KJmahx4VXzZ+7Uug==
X-Received: by 2002:a4a:ec4b:0:b0:69d:e28e:2fff with SMTP id
 006d021491bc7-69e68c51309mr5003541eaf.40.1780813242384; Sat, 06 Jun 2026
 23:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260604230317.30501-1-atwufei@163.com> <20260604230317.30501-2-atwufei@163.com>
In-Reply-To: <20260604230317.30501-2-atwufei@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Jun 2026 11:50:31 +0530
X-Gm-Features: AVVi8CfslfRV_nfpl1lMc7NvFioZQ6rmEDmBn5uL68s_8AeUTuE046d7lHCFWAE
Message-ID: <CAAhSdy3hugWgSPKiuos38-osAFWkvQ3fHph9AMhGQZZAAf+pSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_wp_range
To: atwufei@163.com
Cc: seanjc@google.com, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Wu Fei <wu.fei9@sanechips.com.cn>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_232044_123072_6B2D0B93 
X-CRM114-Status: GOOD (  17.09  )
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

T24gRnJpLCBKdW4gNSwgMjAyNiBhdCA0OjMz4oCvQU0gPGF0d3VmZWlAMTYzLmNvbT4gd3JvdGU6
Cj4KPiBGcm9tOiBXdSBGZWkgPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4KPgo+IFRoZSBjdXJy
ZW50IGdzdGFnZSByYW5nZSB3YWxrZXIgdW5jb25kaXRpb25hbGx5IGFkdmFuY2VzIGJ5ICdwYWdl
X3NpemUnCj4gd2hlbiBhIGxlYWYgUFRFIGlzIG5vdCBmb3VuZCwgZS5nLiB3aGVuIHRoZSByYW5n
ZSB0byB3cCBpcwo+IFsweGZmZmZmMDFmYzAwMCwgMHhmZmZmZjAyM2MwMDApIGFuZCBwYWdlX3Np
emUgaXMgMk1CLCBpZiBmb3VuZF9sZWFmIG9mCj4gMHhmZmZmZjAxZmMwMDAgcmV0dXJucyBmYWxz
ZSwgaXQgc2tpcCB0aGUgd2hvbGUgcmFuZ2UsIGJ1dCBpdCdzIHBvc3NpYmxlCj4gdG8gaGF2ZSB2
YWxpZCBlbnRyaWVzIGluIFsweGZmZmZmMDIwMDAwMCwgMHhmZmZmZjAyM2MwMDApLgo+Cj4gU2ln
bmVkLW9mZi1ieTogV3UgRmVpIDx3dS5mZWk5QHNhbmVjaGlwcy5jb20uY24+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBw
YXRjaCBmb3IgTGludXgtNy4yCgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggZDlmZThiZTJhMTUx
Li4yYjE0MWE3OGVjYWMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC00MjksMTQgKzQyOSwxNCBAQCB2b2lk
IGt2bV9yaXNjdl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3Bh
X3Qgc3RhcnQsIGdwYV90IGVuZAo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gLSAgICAgICAgICAgICAgIGlmICghZm91bmRfbGVh
ZikKPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gLQo+IC0gICAgICAgICAg
ICAgICBhZGRyID0gQUxJR05fRE9XTihhZGRyLCBwYWdlX3NpemUpOwo+IC0gICAgICAgICAgICAg
ICBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFkZHIsIHB0ZXAsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfbGV2ZWwsIEdTVEFHRV9PUF9XUCk7
Cj4gLW5leHQ6Cj4gLSAgICAgICAgICAgICAgIGFkZHIgKz0gcGFnZV9zaXplOwo+ICsgICAgICAg
ICAgICAgICBpZiAoIWZvdW5kX2xlYWYpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBhZGRy
ID0gQUxJR04oYWRkciArIDEsIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkciA9IEFMSUdOX0RPV04oYWRkciwgcGFnZV9z
aXplKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShn
c3RhZ2UsIGFkZHIsIHB0ZXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcHRlcF9sZXZlbCwgR1NUQUdFX09QX1dQKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBhZGRyICs9IHBhZ2Vfc2l6ZTsKPiArICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
fQo+ICB9Cj4KPiAtLQo+IDIuNTEuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
