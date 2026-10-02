Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE526CA5FC4
	for <kvm-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RzhbKEYfc98p1OlHeYHqiQ70n36rN0ExZq64VmgQlA=; b=sGlYS0aHHvLR5h
	LTAdyC5/kRLDea780pMBidRT4pMtmrqwxVb5r+ElhB5L6VmBSCGGOmChiuGIxia4lFRK7VVA8Uyic
	ROaxTwjV4hKzlICfn/Gjt/sdE0uUu+PVikc1ndJmseYeBDy/tuk1K/QlQhoDBFu0G8WhMD1w351AR
	DCu72PYHAUZotZmEDwM5agm/1MIs2heArcWAIBVMR0oVrf9TTaWnjyVx3hbdpefjGH050+73dMCFj
	wNs0UXvGeklTpUs9klOe2KchgkWyKqw3osVmDmxAKQBkNTlqQsVB2CwhJusn19dOqzDL+o09oaJJw
	WCM8MAn2Eo3M2LXXj4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX9A-0000000Akc2-2mFp;
	Fri, 02 Oct 2026 06:53:32 +0000
Received: from mail-lr2-x0d.google.com ([2a00:1450:4864:38::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX97-0000000Akat-3P6A
	for kvm-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:53:32 +0000
Received: by mail-lr2-x0d.google.com with SMTP id 38308e7fff4ca-3a76cedd9baso30521411fa.2
        for <kvm-riscv@lists.infradead.org>; Thu, 01 Oct 2026 23:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924008; cv=none;
        d=google.com; s=arc-20260327;
        b=f3+YuFl61gickKcUEB8aM9wQZCWjsuKB6KmJ7Ung80aDH5gp0p03bfpQ1MCl4TTjyl
         T5tff2fKiCDZnuPmEN8PJClkG4h7AItMHB1wivSO8DIFV03UcKCxPx5QHgYNvX82OdLG
         smMRzsMTUDTJZCLu/UdZo94k4xkbU/Y9OIAMracLA7wk5VcOGrBrT9QGwjdrIl1E4EoZ
         mFquXwL+Sot0IZjBd+OmwvWIKeO4XmThN5Aht7A/Lw7RqAxGU1Iee8Ykhs5u7ctjsiOf
         orUpHkosV6BnJ+Qa9YW+1G1ie7XY35Q138wmQVyMSqXuiw/Y8KhyGJJsNXor3pmR/obX
         iylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pB/qGu4pK5apMENgJwNFrZAZpWxtcAn8jGhRKIo64Ro=;
        fh=U2vJJ6wJZEp5nEi7GOlgAqG+jZ5uREJDMYS7qUwMYMY=;
        b=kxyCaYrK6U7FpPODK7LxLW06cuMCkjfPncWpDI9yS3TdEE7Rudff2nT1IfLjkcyUYk
         moJdsW12/X2zVPu3kkdvuuLZeV8uq7iTF0WhVNui++0TEhRtVKQdygncNhCqP3EguTEn
         FPLbBhe3gDRgMVgJ/to58LBXJ2rBfePSY/LA9EoF7VHASE5rV6Tlc+Qb2IgDzr4DE6TA
         UBaSxLQaKKiL3OSQKld1IL2Gq/fh3srQ+SCMhTwlvSdeYynKjtBJuYP7Dfc2Cg8FmSD5
         Jeqv4rCMFkZKIsclBvu4Ilutb8S39GQXDA9G+LegP24McNzdNi1/0Y04uwGS3IeyTPX9
         MLVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790924008; x=1791528808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pB/qGu4pK5apMENgJwNFrZAZpWxtcAn8jGhRKIo64Ro=;
        b=elxTXOoslmG6Y66gy23pEoZ0hvw3DFNKbEBfZWsbuCqTvwcWLgvJEAA9WuZnnIbaKl
         eW12oakQXQIhgsQwybtJ7smaTxLsncqebenaWIS7z026eFaNZ6HMpWgUpp2h7TAfGmqc
         sT2W/nzywYbyi4+uWXAsgzp2gVTliY36xVInCfws0KORO0CRzmcnqYR5htCEjqImWwgO
         BGhMdZXkRjELbC823DHlt4DtaOuR4RDOY2sa28w10TqUNP3pNZIkem/Cjy8HCyFCjT2K
         MbZqUy7YvZ58jXjjTM13qi5ptgFzqyHZ6IjMsH8FI65+WOKqdJDMTqueOwb5hJFaymQd
         HfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924008; x=1791528808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB/qGu4pK5apMENgJwNFrZAZpWxtcAn8jGhRKIo64Ro=;
        b=BcH5DRXJwXzxFMoF2Ylz7JmnCf8m7vlM06W/P/Cae0gplq9zYD+wGb0PPLB/pht7Ta
         ovs4MFIrVQ/AHtbgz5ABLk/hIQSx/24kaIjIywkhUSF4INX1INavI4NcfRxgbldyCJr1
         2ggL4Vdy7C9euFnKPT0rNNSgzz55aPl0dukuclaXvDdWnLOpeUn5C45HFBi3lr1xboUi
         z45NfiGzO7yUu1JRWIj/4AT6SMZXJBfi+lH974Uof01PvlWGKxF5rTqaKUoS/sM+G1Bb
         BCTV/7v0gFnmF2EdaXBuU9zb+Dmd2nhUpV+oA7XvMSBiUL4WRJ37AX1s8XAxT9dmD1BN
         ywIA==
X-Forwarded-Encrypted: i=1; AKwUvBx0s71Wy4S5UOl0ufiOmue8IZNWEASgr2Ez1d3whlIcUwrj+/+lvMHWGBZ+FBc2C6V0Fj4cbtqzUz0=@lists.infradead.org
X-Gm-Message-State: AFq9FYKoBvgTLGhjdG9TDnuTKIh/jYi3zGoxZIqVSfJZIDTQwLCAuFxa
	xV85iEsVBvlEnEEUElJjaauRtSIXxF2R29kTy3W7CQPR5UntmJhCsXWr/zaUAqWOguBcfl/EB+D
	EFodazkV31grEECg9Z/uhg7WeO8liFVxZVNWqitLGbw==
X-Gm-Gg: AYBFou1hz7yOj+thgYAAwHxG8B/1D/jPLReWpZHXjJGv5v2EeceUFkGOPIVaO8z6c8S
	3Af/4bGF70pGIj9oBId4k3v6pbG+QtcK1txRJNMsTibY8f1v3DA44btrL94I0YE7pq6D2mWLQtM
	9bNIKxq6vkjCjKHUL9QTYdt7Rf/l9TkanllqIPqKi8tRaAAwcjADk4A9Mrvn5j7XDx1/AsMPxpm
	8DzD5d9y8dQa48K+s3G4GfI5z0AMGNQegtKKVF2/dLDn8Kp+E9NtyICvkEH0BYrp1LWQc6LS6Mx
	0uwGLBgmSYpEEJteGOKUqkt1UjfjKVQbKdT535xm9y4P5+/0Vuc1aJ7WpqBB2Sj3VcznevqrQD7
	gkW9SnopF0/zN3hHmCrY1J9Hz2080jWTHLFl8sRZFiUlBtctbelOVEk2EglMavoPJN/sGBM3gII
	0=
X-Received: by 2002:a2e:a802:0:b0:3a6:6f81:1027 with SMTP id
 38308e7fff4ca-3a88781b897mr3633851fa.24.1790924007662; Thu, 01 Oct 2026
 23:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260730093614.983508-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20260730093614.983508-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2026 12:23:14 +0530
X-Gm-Features: AclHuK_kRPavXtWsReKC9CryYELBy8XCMd0E391B5VzjdtS0vtPoxj_Th0S8j2Y
Message-ID: <CAAhSdy0UgBGd2M=Zq3XiaTY-Y5uTrAcOtFF=haKgmFBRB1=ggw@mail.gmail.com>
Subject: Re: [PATCH] riscv: KVM: Add hart-to-vCPU mapping for faster MSI injection
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_235330_224780_2C691A98 
X-CRM114-Status: GOOD (  23.34  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgMzowNuKAr1BNIEJpbGxYaWFuZwo8eGlhbmd3ZW5jaGVu
Z0BsYW54aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IFJlcGxhY2UgbGluZWFyIHNlYXJjaGVz
IG92ZXIgYWxsIHZDUFVzIGluIE1TSSBpbmplY3Rpb24gcGF0aHMgd2l0aCBhCj4gZGlyZWN0IGhh
cnRfaW5kZXggLT4gdkNQVSBsb29rdXAgdGFibGUuIFRoaXMgYXZvaWRzIE8obikgc2NhbnMgb24K
PiBldmVyeSBpbmplY3RlZCBpbnRlcnJ1cHQgYW5kIGltcHJvdmVzIHBlcmZvcm1hbmNlIHdoZW4g
dGhlIG51bWJlciBvZgo+IHZDUFVzIGlzIGxhcmdlLgo+Cj4gQm90aCBrdm1fcmlzY3ZfYWlhX2lu
amVjdF9tc2lfYnlfaWQoKSBhbmQga3ZtX3Jpc2N2X2FpYV9pbmplY3RfbXNpKCkKPiBub3cgdXNl
IHRoZSB0YWJsZSBpbnN0ZWFkIG9mIGl0ZXJhdGluZyBvdmVyIHRoZSB2Q1BVIGxpc3QuCgpUaGUg
QUlBIGhhcnRfaW5kZXggYml0cyBmb3IgVkNQVXMgYXJlIGJhc2VkIG9uIHRoZSBJTVNJQyBhZGRy
ZXNzCnNldCBieSB0aGUgS1ZNIHVzZXItc3BhY2UgYW5kIGFyZSBub3QgcmVxdWlyZWQgdG8gYmUg
Y29udGlndW91cyBoZW5jZQp0aGlzIHBhdGNoIGlzIGFscmVhZHkgYnJva2VuLgoKTkFDSyBmcm9t
IG15IHNpZGUuCgpSZWdhcmRzLApBbnVwCgo+Cj4gU2lnbmVkLW9mZi1ieTogQmlsbFhpYW5nIDx4
aWFuZ3dlbmNoZW5nQGxhbnhpbmNvbXB1dGluZy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX2FpYS5oIHwgIDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMg
ICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV9haWEuaAo+IGluZGV4IGM2N2VjNWFjMC4uNzEyNDBiMGEyIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fYWlhLmgKPiBAQCAtNDcsNiArNDcsOCBAQCBzdHJ1Y3Qga3ZtX2FpYSB7Cj4KPiAg
ICAgICAgIC8qIEludGVybmFsIHN0YXRlIG9mIEFQTElDICovCj4gICAgICAgICB2b2lkICAgICAg
ICAgICAgKmFwbGljX3N0YXRlOwo+ICsKPiArICAgICAgIHN0cnVjdCBrdm1fdmNwdSAqKmhhcnRf
dG9fdmNwdTsKPiAgfTsKPgo+ICBzdHJ1Y3Qga3ZtX3ZjcHVfYWlhX2NzciB7Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYwo+IGluZGV4IGJlODNjMmQ1Zi4uNTk1NTUzODE3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+
IEBAIC0yNTMsNiArMjUzLDE0IEBAIHN0YXRpYyBpbnQgYWlhX2luaXQoc3RydWN0IGt2bSAqa3Zt
KQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICsg
ICAgICAgYWlhLT5oYXJ0X3RvX3ZjcHUgPSBrY2FsbG9jKGt2bS0+Y3JlYXRlZF92Y3B1cywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBrdm1f
dmNwdSopLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VS
TkVMKTsKPiArICAgICAgIGlmICghYWlhLT5oYXJ0X3RvX3ZjcHUpIHsKPiArICAgICAgICAgICAg
ICAgcmV0ID0gLUVOT01FTTsKPiArICAgICAgICAgICAgICAgZ290byBmYWlsX2NsZWFudXBfYXBs
aWM7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgLyogSXRlcmF0ZSBvdmVyIGVhY2ggVkNQVSAq
Lwo+ICAgICAgICAga3ZtX2Zvcl9lYWNoX3ZjcHUoaWR4LCB2Y3B1LCBrdm0pIHsKPiAgICAgICAg
ICAgICAgICAgdmFpYSA9ICZ2Y3B1LT5hcmNoLmFpYV9jb250ZXh0Owo+IEBAIC0yNzQsNiArMjgy
LDEyIEBAIHN0YXRpYyBpbnQgYWlhX2luaXQoc3RydWN0IGt2bSAqa3ZtKQo+ICAgICAgICAgICAg
ICAgICAvKiBVcGRhdGUgSEFSVCBpbmRleCBvZiB0aGUgSU1TSUMgYmFzZWQgb24gSU1TSUMgYmFz
ZSAqLwo+ICAgICAgICAgICAgICAgICB2YWlhLT5oYXJ0X2luZGV4ID0gYWlhX2ltc2ljX2hhcnRf
aW5kZXgoYWlhLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFpYS0+aW1zaWNfYWRkcik7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAo
YWlhLT5oYXJ0X3RvX3ZjcHVbdmFpYS0+aGFydF9pbmRleF0pIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFp
bF9jbGVhbnVwX2ltc2ljczsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBh
aWEtPmhhcnRfdG9fdmNwdVt2YWlhLT5oYXJ0X2luZGV4XSA9IHZjcHU7Cj4KPiAgICAgICAgICAg
ICAgICAgLyogSW5pdGlhbGl6ZSBJTVNJQyBmb3IgdGhpcyBWQ1BVICovCj4gICAgICAgICAgICAg
ICAgIHJldCA9IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbml0KHZjcHUpOwo+IEBAIC0yOTMs
NiArMzA3LDkgQEAgc3RhdGljIGludCBhaWFfaW5pdChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92
Y3B1X2FpYV9pbXNpY19jbGVhbnVwKHZjcHUpOwo+ICAgICAgICAgfQo+ICsgICAgICAga2ZyZWUo
YWlhLT5oYXJ0X3RvX3ZjcHUpOwo+ICsgICAgICAgYWlhLT5oYXJ0X3RvX3ZjcHUgPSBOVUxMOwo+
ICtmYWlsX2NsZWFudXBfYXBsaWM6Cj4gICAgICAgICBrdm1fcmlzY3ZfYWlhX2FwbGljX2NsZWFu
dXAoa3ZtKTsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiBAQCAtNTUxLDMwICs1NjgsMjgg
QEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9haWFfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
PiAgaW50IGt2bV9yaXNjdl9haWFfaW5qZWN0X21zaV9ieV9pZChzdHJ1Y3Qga3ZtICprdm0sIHUz
MiBoYXJ0X2luZGV4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGd1
ZXN0X2luZGV4LCB1MzIgaWlkKQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGlkeDsKPiAg
ICAgICAgIHN0cnVjdCBrdm1fdmNwdSAqdmNwdTsKPiArICAgICAgIHN0cnVjdCBrdm1fYWlhICph
aWEgPSAma3ZtLT5hcmNoLmFpYTsKPgo+ICAgICAgICAgLyogUHJvY2VlZCBvbmx5IGlmIEFJQSB3
YXMgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5ICovCj4gICAgICAgICBpZiAoIWt2bV9yaXNjdl9h
aWFfaW5pdGlhbGl6ZWQoa3ZtKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPgo+
IC0gICAgICAgLyogSW5qZWN0IE1TSSB0byBtYXRjaGluZyBWQ1BVICovCj4gLSAgICAgICBrdm1f
Zm9yX2VhY2hfdmNwdShpZHgsIHZjcHUsIGt2bSkgewo+IC0gICAgICAgICAgICAgICBpZiAodmNw
dS0+YXJjaC5haWFfY29udGV4dC5oYXJ0X2luZGV4ID09IGhhcnRfaW5kZXgpCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbmplY3QodmNw
dSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBndWVzdF9pbmRleCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBpaWQpOwo+IC0gICAgICAgfQo+ICsg
ICAgICAgaWYgKCFhaWEtPmhhcnRfdG9fdmNwdSB8fCBoYXJ0X2luZGV4ID49IGt2bS0+Y3JlYXRl
ZF92Y3B1cykKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiAtICAgICAgIHJldHVybiAw
Owo+ICsgICAgICAgdmNwdSA9IGFpYS0+aGFydF90b192Y3B1W2hhcnRfaW5kZXhdOwo+ICsgICAg
ICAgaWYgKCF2Y3B1KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICBy
ZXR1cm4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdCh2Y3B1LCBndWVzdF9pbmRleCwg
MCwgaWlkKTsKPiAgfQo+Cj4gIGludCBrdm1fcmlzY3ZfYWlhX2luamVjdF9tc2koc3RydWN0IGt2
bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21zaSAqbXNpKQo+ICB7Cj4gICAgICAgICBncGFfdCB0cHBuLCBp
cHBuOwo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBpZHg7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHU7Cj4gLSAgICAgICB1MzIgZywgdG9mZiwgaWlkID0gbXNpLT5kYXRhOwo+ICsgICAg
ICAgdTMyIGcsIHRvZmYsIGlpZCA9IG1zaS0+ZGF0YSwgaGFydF9pbmRleDsKPiAgICAgICAgIHN0
cnVjdCBrdm1fYWlhICphaWEgPSAma3ZtLT5hcmNoLmFpYTsKPiAgICAgICAgIGdwYV90IHRhcmdl
dCA9ICgoKGdwYV90KW1zaS0+YWRkcmVzc19oaSkgPDwgMzIpIHwgbXNpLT5hZGRyZXNzX2xvOwo+
Cj4gQEAgLTU4OSwxOCArNjA0LDIyIEBAIGludCBrdm1fcmlzY3ZfYWlhX2luamVjdF9tc2koc3Ry
dWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21zaSAqbXNpKQo+ICAgICAgICAgZyA9IHRwcG4gJiAo
QklUKGFpYS0+bnJfZ3Vlc3RfYml0cykgLSAxKTsKPiAgICAgICAgIHRwcG4gJj0gfigoZ3BhX3Qp
KEJJVChhaWEtPm5yX2d1ZXN0X2JpdHMpIC0gMSkpOwo+Cj4gLSAgICAgICAvKiBJbmplY3QgTVNJ
IHRvIG1hdGNoaW5nIFZDUFUgKi8KPiAtICAgICAgIGt2bV9mb3JfZWFjaF92Y3B1KGlkeCwgdmNw
dSwga3ZtKSB7Cj4gLSAgICAgICAgICAgICAgIGlwcG4gPSB2Y3B1LT5hcmNoLmFpYV9jb250ZXh0
Lmltc2ljX2FkZHIgPj4KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
SU1TSUNfTU1JT19QQUdFX1NISUZUOwo+IC0gICAgICAgICAgICAgICBpZiAoaXBwbiA9PSB0cHBu
KSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgdG9mZiA9IHRhcmdldCAmIChJTVNJQ19NTUlP
X1BBR0VfU1ogLSAxKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4ga3ZtX3Jpc2N2
X3ZjcHVfYWlhX2ltc2ljX2luamVjdCh2Y3B1LCBnLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRvZmYsIGlpZCk7Cj4gLSAg
ICAgICAgICAgICAgIH0KPiAtICAgICAgIH0KPiArICAgICAgIGlmICghYWlhLT5oYXJ0X3RvX3Zj
cHUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gLSAgICAgICByZXR1cm4gMDsKPiAr
ICAgICAgIGhhcnRfaW5kZXggPSBhaWFfaW1zaWNfaGFydF9pbmRleChhaWEsIHRhcmdldCk7Cj4g
KyAgICAgICBpZihoYXJ0X2luZGV4ID49IGt2bS0+Y3JlYXRlZF92Y3B1cykKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgdmNwdSA9IGFpYS0+aGFydF90b192Y3B1W2hh
cnRfaW5kZXhdOwo+ICsgICAgICAgaWYgKCF2Y3B1KQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
MDsKPiArCj4gKyAgICAgICBpcHBuID0gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19hZGRy
ID4+IElNU0lDX01NSU9fUEFHRV9TSElGVDsKPiArICAgICAgIGlmIChpcHBuICE9IHRwcG4pCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgdG9mZiA9IHRhcmdldCAmIChJTVNJ
Q19NTUlPX1BBR0VfU1ogLSAxKTsKPiArICAgICAgIHJldHVybiBrdm1fcmlzY3ZfdmNwdV9haWFf
aW1zaWNfaW5qZWN0KHZjcHUsIGcsIHRvZmYsIGlpZCk7Cj4gIH0KPgo+ICBpbnQga3ZtX3Jpc2N2
X2FpYV9pbmplY3RfaXJxKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgaW50IGlycSwgYm9vbCBs
ZXZlbCkKPiBAQCAtNjQxLDEwICs2NjAsMTQgQEAgdm9pZCBrdm1fcmlzY3ZfYWlhX2luaXRfdm0o
c3RydWN0IGt2bSAqa3ZtKQo+Cj4gIHZvaWQga3ZtX3Jpc2N2X2FpYV9kZXN0cm95X3ZtKHN0cnVj
dCBrdm0gKmt2bSkKPiAgewo+ICsgICAgICAgc3RydWN0IGt2bV9haWEgKmFpYSA9ICZrdm0tPmFy
Y2guYWlhOwo+ICAgICAgICAgLyogUHJvY2VlZCBvbmx5IGlmIEFJQSB3YXMgaW5pdGlhbGl6ZWQg
c3VjY2Vzc2Z1bGx5ICovCj4gICAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfaW5pdGlhbGl6ZWQo
a3ZtKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBrZnJlZShhaWEtPmhh
cnRfdG9fdmNwdSk7Cj4gKyAgICAgICBhaWEtPmhhcnRfdG9fdmNwdSA9IE5VTEw7Cj4gKwo+ICAg
ICAgICAgLyogQ2xlYW51cCBBUExJQyBjb250ZXh0ICovCj4gICAgICAgICBrdm1fcmlzY3ZfYWlh
X2FwbGljX2NsZWFudXAoa3ZtKTsKPiAgfQo+IC0tCj4gMi41My4wCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
