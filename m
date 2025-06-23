Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D78C77B7F
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuxKIAy74ktSFmicOAs522witVEMFWa74dNfi2fVRRI=; b=3K2EQd7EknuFjU
	oyiwH6dfwqoKHzvIcXQx35ucbXndv+EEcKo/aTfT9xooYmGd85SJxRzPJ4BAmdxuoS9GwebrxYQdA
	pCcRsfND2x+ffJBujMoolYiPBhXjrpwPCQkog0TJQtpADokunHSHf/kZz4zy4CSm2lKmRYV5K6Kyg
	4HAExH8Pi0kRlbASsCeKP00rcZFVQ4l30/jT/TIGx3I3YbRMXct0Cpehaz90yiNeEmhPn2MCIPVSb
	rsPZuuNgv/wpkUW3uiDoZtMMxLL+QG3Mzx6mrxZzQRIuj5jY+uMLRnwLwvY8eNd0lo23+53/dT2ke
	TikibIgXflS7ucgBNv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeME-00000002L3S-15Qr;
	Mon, 23 Jun 2025 10:24:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdtD-00000002Fs9-2P5i
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 09:55:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4530e6f4db4so1558735e9.2
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750672497; x=1751277297; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIpxzH7Ey6NOPuneckkYZHJ6AcvohPz9IFjSsSYVnZQ=;
        b=gg++P37CblgwovUyd2ovQEaRUWC7M//CIPSvIr2Gd9qrCQNF1rFRLMPxFQjNJKOwkd
         IKfJcFMRLamSMP+jm8ZUrHCkis0QYifbhsEwR4AAvQfUBDo96MCYw4JZrFD2bPpooZT7
         B5jpaVXUF13qiU9BoroND1SR1+dcHY/p7BALNc4s2XmFy3QDHOK7EFlrpPjgRENKWlWL
         YfiFf7r0RK20dh8TnxelD2gq+Qq2vRohx5pFbnVJSPPzOrgvZhlj0TSopPFHGdnkQgws
         ZkdXgICAPJjXC/xz+X7WCT9aBs0gFdzlxKj3YOW1JK+j4OEO/mCmK0CTC+9hiP68bjhf
         3UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672497; x=1751277297;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIpxzH7Ey6NOPuneckkYZHJ6AcvohPz9IFjSsSYVnZQ=;
        b=oldD9yaht6thGLZLLKGHkXQHci51rSrFWNV1SY1RPvYSOkJvG3SqGOVRYoMk/3P0XO
         pHeqe22dhi3juCwWpcrqtqpjv3LtVZKmD8t2hYibPvZuxGP9ov73h2R5QiRqcTtEiDwE
         g9ZyQUL74lwliZ/Jt+qyBdgpw2D9HcrKuCGG9lt8Y6mceowiPMaLtPfUG6MJVBLulK7P
         oNZSVPthP8EllLJhkTyfqTC/IBwEAiRZJbW/3i4p5pep8MOfPqL/Msng8B1eK7lYGKeI
         d+6Jcan7MxYgCHYRcWx33/Xp/LoduM3SdcGjcq/xDbmFQJ0vlHzYi08N31g+KcoGdu7Q
         Rthg==
X-Forwarded-Encrypted: i=1; AJvYcCVSudL7wjSrcpSySUevr0ZAHaAqLajcsfmM2EumTmUJMNR6ytx2EGQKt0+qzGGpvoVbSgxZ3+YdACo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8fCG9Sz+0P4ngB+AsqvkE+2hE1FnkPRCaetV0hViK7U4WkyfA
	Zc7sxUngdo6LcJHTwmZLyfX3+XOno3bo8yZYbR+eWBKc6/3QW8T0UDpNdy8UhIykR1k=
X-Gm-Gg: ASbGncvK8iky5iM/RjaTc7Oiwx6AfcsLK5n1qSaj6cUE0gY6/+//CCGE389bGKwDGGz
	YfP6ElYI/h5WdK2zK88ScUS8Y5uNxpsT1MO+OjLK/pQEG+5GRqyu99Imk27DVJhKt/0fzZMaQy1
	bJ+N3hKZ7ShMUMB0DokdGuryBod6wC0qak0UJ0D/WFyeb0S2DwY8Mr9nLC1zDST4HfWJG5xRm5y
	dNynN0i3WxghBvHi0miu7e9j9sQoOV5lZjMu7ILrAWyLst/E3i7eHYbC9+GwA9IVqby6EYYt1Eq
	50S11x6xiTKE0OeyJHUsMcNWbW7dRN6PtvDIGt62ykfR4WNAyNWy0vQl3+L51fS/GhM=
X-Google-Smtp-Source: AGHT+IFkDuNZbXec7bV7lPuMQ95q5Ol9D1Ng0Rhf3YsBGcD5BWQyx/AdkT7xTPlkQyoHbl04rNQmfg==
X-Received: by 2002:a05:600c:1d02:b0:450:d4b4:92d0 with SMTP id 5b1f17b1804b1-453653c105emr39996555e9.3.1750672497513;
        Mon, 23 Jun 2025 02:54:57 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10502sm9198663f8f.18.2025.06.23.02.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:54:57 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 23 Jun 2025 11:54:56 +0200
Message-Id: <DATTLU8NTTUV.1L05K3TTMV29X@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Xu Lu"
 <luxu.kernel@bytedance.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
In-Reply-To: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_025459_626644_C2391AAD 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

MjAyNS0wNi0yM1QxMDowNDo0NSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiBPbiAyMC8wNi8yMDI1IDE0OjA0LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+
IEFuZCB3aHkgbm90IGRlbGVnYXRlIHRoZSBvdGhlcnMgYXMgd2VsbD8KPj4gKEVYQ19MT0FEX01J
U0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NFU1MsCj4+ICBFWENf
U1RPUkVfQUNDRVNTLCBhbmQgRVhDX0lOU1RfQUNDRVNTLikKPgo+IEN1cnJlbnRseSwgT3BlblNC
SSBkb2VzIG5vdCBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGV4Y2VwdGlvbiBieSBkZWZhdWx0IGFuZAo+
IGhhbmRsZXMgbWlzYWxpZ25lZCBhY2Nlc3MgYnkgaXRzZWxmLCB0aGlzIGlzIChwYXJ0aWFsbHkp
IHdoeSB3ZSBhZGRlZAo+IHRoZSBGV0ZUIFNCSSBleHRlbnNpb24gdG8gcmVxdWVzdCBzdWNoIGRl
bGVnYXRpb24uIFNpbmNlIHNvbWUgc3VwZXJ2aXNvcgo+IHNvZnR3YXJlIGV4cGVjdCB0aGF0IGRl
ZmF1bHQsIHRoZXkgZG8gbm90IGhhdmUgY29kZSB0byBoYW5kbGUgbWlzYWxpZ25lZAo+IGFjY2Vz
c2VzIGVtdWxhdGlvbi4gU28gdGhleSBzaG91bGQgbm90IGJlIGRlbGVnYXRlZCBieSBkZWZhdWx0
LgoKWWVhaCwgSSBmb3Jnb3QgYWJvdXQgeW91ciBwYXRjaGVzIHRoYXQgY29uZmxpY3Qgd2l0aCB0
aGUgY2hhbmdlLCB0aGFua3MuCgooVGhlIGN1cnJlbnQgS1ZNIGV4Y2VwdGlvbiBoYW5kbGVyIG9u
bHkgZm9yd2FyZHMgYWxsIHRoZSBsaXN0ZWQKIGV4Y2VwdGlvbnMsIHNvIHRoZSBvbmx5IG9ic2Vy
dmFibGUgZGlmZmVyZW5jZSB0aGlzIGNoYW5nZSB3b3VsZCBtYWtlIGlzCiB0aGF0IHRoZSBLVk0g
U0JJIFBNVSBldmVudCBpcyBub3QgY291bnRlZC4pCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
