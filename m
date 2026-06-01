Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F0CD6E4C
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jD51Gz73Ffwt4gDm42us046tA9roR//b8yyYt7/YN4=; b=xR3lcOK1yNj4vl
	5YfBcEo2hRfY3J3T0Q6NioXOX59I1Z9vrhGNwimyy0Nu5RNsYiS7G5n3V+vWml4yr5m5qzFtHh1Ns
	GE7d/dHQ3NQ4ck72MH0zM9aVywws5twcAWQ1cPOxL6UIVFj/Cc9iFKt5zJu9dWRkQWRv58qTj/0kZ
	50XE6F+1oH6DspDR9plYPL/j4bbvfHrUzyAdVuEVt+WL8qMC/UjD86A4zxOKWAmscHBLAZe8QYoFT
	GYMV91V9Ey94gEKJZg5Cq75BGIwbseI1E87IixgDTM1p6FX6piCFsW/uBGp1bB/mA9zt8LYdduOhI
	1G1MX28TJgsGLXe/Q9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3M-0000000ACL5-1Z6Z;
	Mon, 01 Jun 2026 06:23:12 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3J-0000000ACKL-3NBU
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:23:11 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e61f8d3cbfso4488901a34.0
        for <kvm-riscv@lists.infradead.org>; Sun, 31 May 2026 23:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780294988; cv=none;
        d=google.com; s=arc-20240605;
        b=jDdsin/xMC+VHUHqfClZynz0YJdpdP9QfP3GcIH0Y8EDhqo2HRnMsXCyZ/wVUpmKH6
         dkNcChYZV5IOVahqQtHwFhUQTZl51Le+3iem817KWhi+PsMqC1Nw6V5F1gOquKQy345K
         r7cuwoj+w6hNkGWYQG9DJjyh9A4uc1s1+OcFt/uRmV6m9Cn43de9v9Ly/1S9s+Pcz/Hk
         /ZaXmf5/XNiNcLMNFuBq7x0ScsFy9q8QR3UvRJS5PhhFRanA16jTsQqeRKMs12dScLJL
         CAJyiyhbPzXoe8tLvuJ8gHi76g6pP2p7PzOHHOK5e5YJdd/8/gmMxMTTNv47GdqlbLT/
         cJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kWHpaPNjlLn1h4xW7W+h38NolXiKY+AKV1544G3Mpp8=;
        fh=0GHa4GVOf2xKC4apwhqyE0q9WM8/ykC5HN7cbrYQITk=;
        b=AVanIFysmIdY9JJQAnvrL36nOtvcnMaIDD2GH0nEFFOwb6DBsYfhaGLx8+cZbTlEq3
         CGzcSwbfC85gY924jirdJRVUfBdoz256hxmAPjdE+yv30AIcLL3nPwLeKEYku+NF/Dy0
         LV4QJ4x5WTBRnxotnvJ8RKiLahofQY6ggHjVvpWN4c1sfz1yYGtDjv751gfNGXeP+UUu
         VuRqKj1q6Eg6FqcoFUDt3+JGQ41Ec+DSpxDLu04FoT6S0l//Cl7ADjguDC2h6mUk3aed
         jdSWJt4TGTo5AcHVFOgVRlgb+GvvcX0oZiKSvMV+eFuGn2jPl201RbUK+hrIUG7m86ta
         DCMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780294988; x=1780899788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWHpaPNjlLn1h4xW7W+h38NolXiKY+AKV1544G3Mpp8=;
        b=CJ0SYDCyAdtqcki93cMjQx5ju1bgMpB0mb20Nx3h79U4Ny7xUdL7NvDqo+t4g/9p9n
         seCUn71tmd4p1Obp+ArNk9q3NmKlUBKKBgcrHrpSexnpy5KQX4oyNnUM3tj8l8SKfqbA
         I++cs67KV3uaX/bFOc/JH4/enRWFE/MyQdo+Q/MfDDGMzna3zgkxOBBjcPe3e7sijog7
         r3txgE7sGlmmXj7iQDaL+DhpU9kDvUj/bw3h99s4/0rF73yYFUXJCjuXSd8F1xioH8v7
         jX/kbLWefoAFOx1v1pZWSnNivddMabbbjBo6HQn/OUFrh1SmDtlSmqkC9uoo96E0KR5t
         Yj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294988; x=1780899788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWHpaPNjlLn1h4xW7W+h38NolXiKY+AKV1544G3Mpp8=;
        b=oKo2BtvNJuRAIKBWEAtM9jcI4N1TyfPcu762zcvtI/rT5lfFhZSSnU4KObC7DBv4jD
         M0YscANRg3vzUNlYdzyPVqYLIazCylpiu4ylAltZbVYjlP4A1NFqf3HP2eXxTWIpiHWu
         a8PgzddgqYo7YkKy9IVWYtObVwCMd+soqB0XPyYAyuFu/3FNc+utpXPA2tMTAEHxqz45
         NUdLpp1M15KGWNg6rGtstOaRF/0iZG42p+JNioaTAlbUgHp4Kmos1g7uVPmE5NR4uYXo
         ZBByvTb4I+dqZ5u0ZsKOKRyLTA0QZ94mFCVC3Ilu7JBL4GOY1UX8tkWnnHpKTwPUGWl4
         jR5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9/j9PSVtOTNOiMmheiChUt4Hpz9zV1shTXBHp/JvqhQS5g+KJmfyIXTKC9n2KAdUbJ5Gw5zxC435s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxLpqYMm36Ns3QE0zax9bB51sc92y06Y8VNpKZccBXhbko2nCT
	PfMwb38JKAd0f85Cr2HZSEHlHPwt5J2Ivyg7cGMflcocic7FnVmx2raMpTdAUfdXD2Se4OBTs0P
	QcsWzwsyS3/b0eRI4RUxiM4hEM95Iwiscou+pL8N7rA==
X-Gm-Gg: Acq92OG5/4bMx6qkT9v8OEFOKmgret3pL2K+vDfmiPZ9f3EihnHE1OYsLj8h2xHy9/k
	qcgobLQ0eIunoScnebl33wQXCZuGYCq/kbhBnvNYFqEAgMPOTkWjKUeTADJ58l7utZnvHQtCdmc
	NmOj/KQo8pKGmkusPiTUZ00FCcb5PHZHJNomILjB5j9G/CibW9L5nlX0kdFJu4gFNSPtka/Jscl
	VYAg/IeMFbuMa7FDQHr88FB0rl0JxSCUsBuXW+4qTPaWCZZty4RIDhNXirCRhELtdgraPx9C6PS
	71vp5qUglgJteUCFEssTsuW4JYLd5b7UfLyIz2JnZd4uUs0GR4ML1kUAXNyjerYcVBXCVbEQKWk
	rBTA+Kc9wrFzOk2TkhqEF2JUSF8huaFa2lp0UDg==
X-Received: by 2002:a4a:ee18:0:b0:69d:ad54:5162 with SMTP id
 006d021491bc7-69e10192d83mr5068054eaf.4.1780294988377; Sun, 31 May 2026
 23:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn> <20260429173539941luiwhNDDtflTHOClbNtk4@zte.com.cn>
In-Reply-To: <20260429173539941luiwhNDDtflTHOClbNtk4@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 11:52:56 +0530
X-Gm-Features: AVHnY4Il1BNEsVMx4Pb2vyy_duFGTWacQ7iMEvgRHWuEuaREC5jjQWVrV55h8tQ
Message-ID: <CAAhSdy1LE+oTMgO_C9SBvpqF=SHLOdDLGms5_ajO8pqDm=fFuA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_3=2F3=5D_RISC=2DV=3A_KVM=3A_Recover_gstage_huge_?=
	=?UTF-8?Q?page_mappings_during=C2=A0disable=2Ddirty=2Dlog?=
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_232310_107353_9A320C59 
X-CRM114-Status: GOOD (  24.40  )
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

T24gV2VkLCBBcHIgMjksIDIwMjYgYXQgMzowNeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gV2hlbiBkaXJ0eSBsb2dnaW5nIGlzIGVuYWJsZWQsIHRoZSBnc3RhZ2UgbWFwcGlu
Z3MgYXJlIHNwbGl0IGludG8KPiA0SyBwYWdlcyB0byB0cmFjayBkaXJ0eSBwYWdlcy4gSWYgdGhl
IG1pZ3JhdGlvbiBmYWlscyBvciBpcyBjYW5jZWxlZCwKPiBpbiBvcmRlciB0byBrZWVwIHRoZSBW
TSdzIHBlcmZvcm1hbmNlIGNvbnNpc3RlbnQgd2l0aCB0aGF0IGJlZm9yZQo+IGRpcnR5IGxvZ2dp
bmcgd2FzIGVuYWJsZWQsIHRoZSBnc3RhZ2UgaHVnZSBwYWdlIG1hcHBpbmdzIGFyZSByZWNvdmVy
ZAo+IHdoZW4gZGlydHkgbG9nZ2luZyBpcyBkaXNhYmxlZC4KPgo+IFdpdGggdGhpcyBwYXRjaCwg
ZGlydHlfbG9nX3BlcmZfdGVzdCBzaG93cyBhIGRlY3JlYXNlIGluIHRoZSBudW1iZXIgb2YKPiB2
Q1BVIGZhdWx0czoKPgo+ICQgcGVyZiBzdGF0IC1lIGt2bTprdm1fcGFnZV9mYXVsdCBcCj4gL2Rp
cnR5X2xvZ19wZXJmX3Rlc3QgLXMgYW5vbnltb3VzX2h1Z2V0bGJfMWdiIC12IDEgLWUgLWIgMUcK
Pgo+IEJlZm9yZTogNTI0LDgxOSAgICAgIGt2bTprdm1fcGFnZV9mYXVsdAo+IEFmdGVyIDogMjYz
LDIxMSAgICAgIGt2bTprdm1fcGFnZV9mYXVsdAo+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNo
YW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2dzdGFnZS5oIHwgIDQgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jICAg
ICAgICAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9r
dm0vbW11LmMgICAgICAgICAgICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAzIGZpbGVzIGNoYW5nZWQsIDkzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX2dzdGFnZS5oCj4gaW5kZXggOWM5MDg0MzJiYzE3Li5hMDc0NDkzNTk2ZDEgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+IEBAIC02NCw2ICs2NCwxMCBAQCBpbnQg
a3ZtX3Jpc2N2X2dzdGFnZV9zcGxpdF9odWdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX21tdV9tZW1vcnlfY2Fj
aGUgKnBjYWNoZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwYV90IGFkZHIs
IHUzMiB0YXJnZXRfbGV2ZWwsIGJvb2wgZmx1c2gpOwo+Cj4gK3ZvaWQga3ZtX3Jpc2N2X2dzdGFn
ZV9yZWNvdmVyX2h1Z2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3QgYWRkciwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdGFnZXRfcGFn
ZV9zaXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyAqcGFnZV9zaXplKTsKPiArCj4gIGVudW0ga3ZtX3Jpc2N2X2dzdGFnZV9vcCB7Cj4gICAgICAg
ICBHU1RBR0VfT1BfTk9QID0gMCwgICAgICAvKiBOb3RoaW5nICovCj4gICAgICAgICBHU1RBR0Vf
T1BfQ0xFQVIsICAgICAgICAvKiBDbGVhci9Vbm1hcCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggZDlmZThi
ZTJhMTUxLi5lMmM4Y2JhYzMwZDkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0zMzcsNiArMzM3LDQ4IEBA
IGludCBrdm1fcmlzY3ZfZ3N0YWdlX3NwbGl0X2h1Z2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFn
ZSwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3Jl
Y292ZXJfaHVnZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFfdCBhZGRyLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0YXJnZXRfcGFnZV9z
aXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAq
cGFnZV9zaXplKQo+ICt7Cj4gKyAgICAgICB1MzIgY3VycmVudF9sZXZlbCA9IGdzdGFnZS0+cGdk
X2xldmVscyAtIDE7Cj4gKyAgICAgICBwdGVfdCAqbmV4dF9wdGVwID0gKHB0ZV90ICopZ3N0YWdl
LT5wZ2Q7Cj4gKyAgICAgICB1MzIgdGFyZ2V0X2xldmVsLCBvdXRfbGV2ZWw7Cj4gKyAgICAgICBw
dGVfdCAqcHRlcCwgKmNoaWxkX3B0ZXA7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAg
IG91dF9sZXZlbCA9IDA7Cj4gKyAgICAgICByZXQgPSBnc3RhZ2VfcGFnZV9zaXplX3RvX2xldmVs
KGdzdGFnZSwgdGFyZ2V0X3BhZ2Vfc2l6ZSwgJnRhcmdldF9sZXZlbCk7Cj4gKyAgICAgICBpZiAo
cmV0KQo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiArCj4gKyAgICAgICB3aGlsZSAoY3Vy
cmVudF9sZXZlbCA+PSB0YXJnZXRfbGV2ZWwpIHsKPiArICAgICAgICAgICAgICAgcHRlcCA9IChw
dGVfdCAqKSZuZXh0X3B0ZXBbZ3N0YWdlX3B0ZV9pbmRleChnc3RhZ2UsIGFkZHIsIGN1cnJlbnRf
bGV2ZWwpXTsKPiArCj4gKyAgICAgICAgICAgICAgIG91dF9sZXZlbCA9IGN1cnJlbnRfbGV2ZWw7
Cj4gKyAgICAgICAgICAgICAgIGlmICghcHRlX3ZhbChwdGVwX2dldChwdGVwKSkpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBUaGUg
bWFwcGluZyBpcyBhbHJlYWR5IGEgaHVnZSBwYWdlIG1hcHBpbmcuICovCj4gKyAgICAgICAgICAg
ICAgIGlmIChnc3RhZ2VfcHRlX2xlYWYocHRlcCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Z290byBvdXQ7Cj4gKwo+ICsgICAgICAgICAgICAgICBuZXh0X3B0ZXAgPSAocHRlX3QgKilnc3Rh
Z2VfcHRlX3BhZ2VfdmFkZHIocHRlcF9nZXQocHRlcCkpOwo+ICsgICAgICAgICAgICAgICBjdXJy
ZW50X2xldmVsLS07Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgLyogUmVwbGFjZSB0aGUgaHVn
ZSBQVEUgd2l0aCB0aGUgZmlyc3QgUFRFIGVudHJ5IG9mIHRoZSBjaGlsZC4qLwo+ICsgICAgICAg
Y2hpbGRfcHRlcCA9IChwdGVfdCAqKSZuZXh0X3B0ZXBbMF07Cj4gKyAgICAgICBpZiAoZ3N0YWdl
X3B0ZV9sZWFmKGNoaWxkX3B0ZXApKSB7Cj4gKyAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwg
X19wdGUocHRlX3ZhbChwdGVwX2dldChjaGlsZF9wdGVwKSkpKTsKPiArICAgICAgICAgICAgICAg
Z3N0YWdlX3RsYl9mbHVzaChnc3RhZ2UsIHRhcmdldF9sZXZlbCwgYWRkcik7Cj4gKyAgICAgICAg
ICAgICAgIHB1dF9wYWdlKHZpcnRfdG9fcGFnZShuZXh0X3B0ZXApKTsKPiArICAgICAgIH0KPiAr
Cj4gK291dDoKPiArICAgICAgIGdzdGFnZV9sZXZlbF90b19wYWdlX3NpemUoZ3N0YWdlLCBvdXRf
bGV2ZWwsIHBhZ2Vfc2l6ZSk7Cj4gK30KPiArCj4gIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV9vcF9w
dGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3QgYWRkciwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHB0ZV90ICpwdGVwLCB1MzIgcHRlcF9sZXZlbCwgZW51bSBrdm1fcmlz
Y3ZfZ3N0YWdlX29wIG9wKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5j
IGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCBkYzZhOGVmZGU5OWUuLjc4OWUzMzYyMTQ0
ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL21tdS5jCj4gQEAgLTE2LDYgKzE2LDggQEAKPiAgI2luY2x1ZGUgPGFzbS9rdm1fbW11Lmg+
Cj4gICNpbmNsdWRlIDxhc20va3ZtX25hY2wuaD4KPgo+ICtzdGF0aWMgdm9pZCBrdm1fbW11X3Jl
Y292ZXJfaHVnZV9wYWdlcyhzdHJ1Y3Qga3ZtICprdm0sIGludCBzbG90KTsKPiArCj4gIHN0YXRp
YyB2b2lkIG1tdV93cF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwgaW50IHNsb3QpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBrdm1fbWVtc2xvdHMgKnNsb3RzID0ga3ZtX21lbXNsb3RzKGt2
bSk7Cj4gQEAgLTE2MCw2ICsxNjIsMTcgQEAgdm9pZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3Jl
Z2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgICAgICAgIGlmIChrdm1fZGlydHlfbG9n
X21hbnVhbF9wcm90ZWN0X2FuZF9pbml0X3NldChrdm0pKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsKPiAgICAgICAgICAgICAgICAgbW11X3dwX21lbW9yeV9yZWdpb24oa3ZtLCBu
ZXctPmlkKTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAg
ICAgICAgICAgICAqIFJlY292ZXIgaHVnZSBwYWdlIG1hcHBpbmdzIGluIHRoZSBzbG90IG5vdyB0
aGF0IGRpcnR5IGxvZ2dpbmcKPiArICAgICAgICAgICAgICAgICogaXMgZGlzYWJsZWQsIGkuZS4g
bm93IHRoYXQgS1ZNIGRvZXMgbm90IGhhdmUgdG8gdHJhY2sgZ3Vlc3QKPiArICAgICAgICAgICAg
ICAgICogd3JpdGVzIGF0IDRLaUIgZ3JhbnVsYXJpdHkuCj4gKyAgICAgICAgICAgICAgICAqCj4g
KyAgICAgICAgICAgICAgICAqIERpcnR5IGxvZ2dpbmcgbWlnaHQgYmUgZGlzYWJsZWQgYnkgdXNl
cnNwYWNlIGlmIGFuIG9uZ29pbmcgVk0KPiArICAgICAgICAgICAgICAgICogbGl2ZSBtaWdyYXRp
b24gaXMgY2FuY2VsbGVkIGFuZCB0aGUgVk0gbXVzdCBjb250aW51ZSBydW5uaW5nCj4gKyAgICAg
ICAgICAgICAgICAqIG9uIHRoZSBzb3VyY2UuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAg
ICAgICAgICAgICBrdm1fbW11X3JlY292ZXJfaHVnZV9wYWdlcyhrdm0sIG5ldy0+aWQpOwo+ICAg
ICAgICAgfQo+ICB9Cj4KPiBAQCAtNTk4LDMgKzYxMSwzNyBAQCB2b2lkIGt2bV9yaXNjdl9tbXVf
dXBkYXRlX2hnYXRwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIGlmICgha3ZtX3Jp
c2N2X2dzdGFnZV92bWlkX2JpdHMoKSkKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2xvY2Fs
X2hmZW5jZV9ndm1hX2FsbCgpOwo+ICB9Cj4gKwo+ICtzdGF0aWMgdm9pZCBrdm1fbW11X3JlY292
ZXJfaHVnZV9wYWdlcyhzdHJ1Y3Qga3ZtICprdm0sIGludCBzbG90KQo+ICt7Cj4gKyAgICAgICBz
dHJ1Y3Qga3ZtX21lbXNsb3RzICpzbG90cyA9IGt2bV9tZW1zbG90cyhrdm0pOwo+ICsgICAgICAg
c3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCA9IGlkX3RvX21lbXNsb3Qoc2xvdHMsIHNs
b3QpOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodmEgPSBnZm5fdG9faHZhKGt2bSwgbWVtc2xv
dC0+YmFzZV9nZm4pOwo+ICsgICAgICAgcGh5c19hZGRyX3Qgc3RhcnQgPSBtZW1zbG90LT5iYXNl
X2dmbiA8PCBQQUdFX1NISUZUOwo+ICsgICAgICAgcGh5c19hZGRyX3QgZW5kID0gKG1lbXNsb3Qt
PmJhc2VfZ2ZuICsgbWVtc2xvdC0+bnBhZ2VzKSA8PCBQQUdFX1NISUZUOwo+ICsgICAgICAgcGh5
c19hZGRyX3QgYWRkciA9IHN0YXJ0Owo+ICsgICAgICAgc3RydWN0IGt2bV9nc3RhZ2UgZ3N0YWdl
Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBwYWdlX3NpemU7Cj4gKwo+ICsgICAgICAgaWYgKCFm
YXVsdF9zdXBwb3J0c19nc3RhZ2VfaHVnZV9tYXBwaW5nKG1lbXNsb3QsIGh2YSkpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX2luaXQoJmdz
dGFnZSwga3ZtKTsKPiArCj4gKyAgICAgICBzcGluX2xvY2soJmt2bS0+bW11X2xvY2spOwo+ICsK
PiArICAgICAgIHdoaWxlIChhZGRyIDwgZW5kKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChnZXRf
aHZhX21hcHBpbmdfc2l6ZShrdm0sIGh2YSkgPCBQTURfU0laRSkgewoKVGhpcyBpcyBoYXJkLWNv
ZGVkIHRvIHdvcmsgb25seSBmb3IgMk1CIGh1Z2VwYWdlcy4KCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYWRkciArPSBQTURfU0laRTsKPiArICAgICAgICAgICAgICAgICAgICAgICBodmEgICs9
IFBNRF9TSVpFOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAg
ICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX3JlY292ZXJf
aHVnZSgmZ3N0YWdlLCBhZGRyLCBQTURfU0laRSwgJnBhZ2Vfc2l6ZSk7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBhZGRyICs9IHBhZ2Vfc2l6ZTsKPiArICAgICAgICAgICAgICAgaHZhICArPSBwYWdl
X3NpemU7Cj4gKyAgICAgICAgICAgICAgIGNvbmRfcmVzY2hlZF9sb2NrKCZrdm0tPm1tdV9sb2Nr
KTsKPiArICAgICAgIH0KPiArICAgICAgIHNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAr
fQo+IC0tCj4gMi40My41CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
