Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC23606A32E
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwRp9dnS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=SWXiuFUA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AppWBawv3MPw0CX1mujNZOeh6Lw/+KC1du5AjPw7AE4=; b=WwRp9dnSv0KiCOiUn40ALixnhO
	/nDdHUawj/0ERksxRBnv3M6w4XS2jjQ3QmqxWgkebzLxTL6fuS2SVnyoekB8bj0yS5rgsMZh9MNlK
	vNd39ZaWytmU/Dx/PNNVtUiNVvVTRzTB5+F07k5rsiuAvypOKPFStL0yJ131L1b7oBl4R2TksKqmN
	zA29a+JVAZ94lvNi7EPz9SsXs6cue3srMEwkg6yKvWjhPnbdXkezBpVk2OPR4MUD+oOup5DfivYua
	B2f+/txopWSurw1TM53fAHTbvYNzJV5caLeaIit1cRK5ADHEjjyX105HZxxgMTCeAG28Kq6Q4ZS0c
	ruPtejmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tU-00000008UJd-2gQb;
	Wed, 25 Nov 2026 05:50:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tS-00000008UI0-0Q4a
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso50726245e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585808; cv=none;
        d=google.com; s=arc-20260327;
        b=Lf8tYfC9r8cXZ3aqc9Y2BPT2EnSMEF+Ge2T4UhbYlHWpihEUZvm44z7gB2HAhAUjIy
         zqHcQQeKYiC4QNgR997reuQ3aXQ20u5IqNmsnTM3stpY5JBXB/nRLMeUFCZW8BclvevW
         RKj9xY71qMf6H2K//K/3uTycuivPnnFIKbpYryKNFudcvNYhbcXRdYJ21sGJO2G7X5cl
         XaajUdhbjfyZ49UxE7fwWw1bxE/ziHp6FLteZ42wQ7104sX8JfpiGcd7BzLhJJeU+oSn
         7a8nsNDM5r0LK5FVgjZxaxkKGJbWTVR5osSx/zL4szX33flwsDQT3sByxIRiJe4W5Ak+
         SXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        fh=62cDdpwS/rpDwb7yaAFnIOjnQZRCnozR4b3S1OSPRag=;
        b=p40VpQ13MviC+EU4gzSLIFBUyyqz2HkcZRxePIKqpN8oIN7z6WC5bR+6ziFNfOK9GA
         PJmtztYGmfp1uijtQwg8LnirxgNC9yYau4Zc+u9737txsZeeg/SgD7qV+obACWCeG1CN
         EaFdyCnitEXSQOXeIp5k1AbsTo7rpxbKTVEuKeKRPOCNv7lUAxsa88i6Theh3zc0Ctu4
         Z5Jl+y3xEtQF9wz/81JSMXbKa8U0S8OO3DTOTdZWoPtHIeBQNtpxlb8c2lZykQS3Fch6
         1epuI0co6RMs2rSf51hS9QKDwphQk4+C/8P5L4WR4NHkldiehpY0KvvGigtyDhUMwoRo
         wNxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585808; x=1796190608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        b=SWXiuFUAE+vUWjaZ7OLv36+Kn0gnpnPan/LfTo8JwamG2LMz8zaymzV00KIr6w1pPE
         NDxkizo05OkMIxeLJat7JxXl4BC19uCUS4NonHDnzGAoBbCQ6N4wx14avMijqL71yQyr
         tqIZmbMxk3nb9K/wiWOSlec2pNmC8nGiAvGEU1h8Nj36NacLVcg6P1bxLvWluZDeezer
         Ra2gl05/Q8e90FUFgNZMa7xMQj3cFXGrp1a0jwQKC20C+XNmqJegdV7Sr/UlqEo+GLDl
         yOPtFKuqOEaxA+pm4yrJpXvd8Pzo1IvzCGIthSEvxbsCiL5mPOlJVzwXhFxXNb5yH9Xu
         vsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585808; x=1796190608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        b=u4o8YAKj0DJEH2EPAf6x8KbTPRsOv7OoCXh0gmkBfkOsHWGNn/DutQdKSsDD8LJF48
         sn+dFLfidGmN5+2MxXsXYyyvi+k8V+LtvZpo0ktZuSm4E7JP7zEKMoXcuknVCncnQxqR
         fnU3Z2XbsliRYsUa4jhJev1Ks5De+Py6fVJybS1FAPERrbsTfujx6wNVSCNQzveA1PMX
         rkJbiTzcz/CS+5vDJSRXCgQhzhuPC4SI0tKTQBQ54uNpBTUx+dRp3brBsG755gGr+fuH
         zRaYkKupAIPo6sGIPQ80dH8amNudgCw3uCvKjnVlxYPJx0Y8pjNOXjdcHbL5JtaKhTx0
         izZQ==
X-Forwarded-Encrypted: i=1; AL+hErFTom0POex+Z6OnGadn7EZS03RnSjlbuvFM+3Tbvq/ppHGUGu9Y2cG/5BF515wtLDUJ98LpIZoTiBQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+tVNZM/KjRAsXdTKHOLa8VZMsFqI3+XMxsqJYDrKrb8HLBjYTx
	JGeKpCZByZljjgxNqTUvNcJup06qHw53LtC+c6Ie5gUIz4lKGWt8lITZXs9Py5Eg25hFeNM+fCw
	WMvqJjZJnE56fYeDqM7oW08BgxnTHM3tEAU7sz2Ef7A==
X-Gm-Gg: AZFdTZeUntGpmhBftzcDDJxqxRkJhxCpNBeg51ik7lYjKyYxc2umEvKAA+IT3cPQw46
	Pf3nealkyKVW7zojCRJolrVdr6KNS1m67lx271i0y9dZZMDy0fqtAi23vrbC/2c3hoxdtyrzuKs
	NEmGNFKYmHHLrKG3raWsd/yUx//SHk7P6HLHhCXwOlR0cdmlfeDegF3ftrcyFSYz83TXjgTwgaU
	C8xkkPN9HnjArEe5qCU7mkbeqWFzYxMFzUDLgF/3iJDSAKWujUAYLot8t03FskJJ6o/iz6iqh80
	qx4XJbTRARLXsWjhjWvQZKFjdXl3qgO6li2HRViCSU60Px3bD5hbnp91De8yc2U4JmWQmt1r2Nz
	i6MNIF3Hf6nmBkr1iE/lLbJkDZvAGSUANrEX0gn9wPZjDnPGfh3uhuj3XXxPAgzuSCtnIjSYZik
	t/D02fgRouuphr+cetFj/3NsEG8PxH+cNnloK+tnJQdZxO6vEmwu6+qAY=
X-Received: by 2002:a05:600c:1d29:b0:4a9:2a92:231f with SMTP id
 5b1f17b1804b1-4bb88804d4dmr362487905e9.7.1795585808512; Tue, 24 Nov 2026
 21:50:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-4-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-4-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:56 +0530
X-Gm-Features: Aa3M54olVHavWeAlguF4P6c6438TRdv0cvM9VsXLh3lRZmC_JVPz05hHC99ALdY
Message-ID: <CAAhSdy0Ev2MKxS6J1OrD+mHKMw-izwi5ywHLJZT4fN0K-U-CHw@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] KVM: riscv: Write-protect G-stage PTEs atomically
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215010_161089_B817C30B 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gR1NUQUdFX09QX1dQIGNsZWFycyB0aGUgVyBiaXQgd2l0
aCBhIHJlYWQtbW9kaWZ5LXdyaXRlIG9mIHRoZSBlbnRpcmUKPiBQVEUuIExvY2tsZXNzIGFnaW5n
IGNhbiBjb25jdXJyZW50bHkgY2xlYXIgdGhlIEFjY2Vzc2VkIGJpdCwgYWxsb3dpbmcKPiB3cml0
ZS1wcm90ZWN0aW9uIHRvIG92ZXJ3cml0ZSB0aGUgdXBkYXRlIHdpdGggYSBzdGFsZSBQVEUgdmFs
dWUuCj4KPiBDbGVhciBXIGF0b21pY2FsbHkgd2l0aCB0ZXN0X2FuZF9jbGVhcl9iaXQoKSBzbyB0
aGF0IGNvbmN1cnJlbnQKPiBBY2Nlc3NlZC1iaXQgdXBkYXRlcyBhcmUgcHJlc2VydmVkLiBJdHMg
cmV0dXJuIHZhbHVlIGFsc28gcHJlc2VydmVzCj4gdGhlIGV4aXN0aW5nIGJlaGF2aW9yIG9mIHJl
cXVlc3RpbmcgYSBUTEIgZmx1c2ggb25seSB3aGVuIFcgd2FzCj4gYWN0dWFsbHkgY2xlYXJlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFNldW5nSnUgQ2hlb24gPHN1dW5qMTMzMUBnbWFpbC5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
