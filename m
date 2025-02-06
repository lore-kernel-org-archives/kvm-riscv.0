Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E9AC02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZm903zJQb5rSZMNr6zJ44ru7MRxp+uuzYPXUstG338=; b=yfItNn+2BC/Sh1
	Odxwe23qJjKou6+TIL9LWYplCVwu7UE8Kusxxrrg1DLJZ4zmuBkE74bNYKsfiRDH5t92mG72ssJVK
	CHqunUhAmfy560MsYAsNCKg0QUGXtLSn6MUdHKs1aKNL9IZitYqrY/jVITuJJMmHT8knw76pad6u9
	w3yEocWGJJnmaS4CuO/V0IY6CEbWlyDiSyF1Lkyaf9rRzOerNNCvKpVJxRyDnWomJVRYr6hAno7xx
	Qn3sk2vGZCNVOuvOUbmSq2gDVfkTbmsexjcXGNE+PD6qE7r/4avv3V/dqQ6hEmdNOPpeL2FHJzErg
	GkuJPuJG5B0VCELjBj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwQR-00000005boC-05v9;
	Thu, 06 Feb 2025 07:35:51 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEU-00000005Y5f-2GH6
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f9cd9601b8so953014a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826610; x=1739431410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYw8eDaBPoa3lZTMqvm38RPB8/mlpG4q3+7Mk5EH9kg=;
        b=xvLjzbVwNxJdf5bic6yw+CSr9TLJmODEG2Uax4QhRTKYOEZNpS/iMmm662Ta2wjEe4
         ntH5rODq15GTB5i+MRLQE2P2uCxbGmQg8gmeMDjALtHJc5+pNWrN+/UrUQemp1CgJtwn
         1nu4rT4syaZCx5JDPqAQ/Z/eJwuLCEgIeQmo4mlfN/CwAeRRwj2+VB5oXLgjHOl669Zk
         nQBOdGsPohpbvGTU4Og592uX7vgMb18pJ74+AV5h1uIFrna8bfsS4TKwF1CQ1OBxrGTX
         V1sUMRlOb17q+Iwu4IeENjLdth1eIIzJEVzSnZQZw8/JWmu0yIiwjzS2NPYRSfXUQEuF
         MwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826610; x=1739431410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYw8eDaBPoa3lZTMqvm38RPB8/mlpG4q3+7Mk5EH9kg=;
        b=pSyl9zhFXiWZlaqv+hCkgTfBCPrWilsyDF9I5vMJ0GY6EsnuufDBek5hRWGnOJoNZN
         uNavvjsA6SqDXZBS1a0qQUaEIeFbYU+rmmGMNVc9VCqdJDH4iMw7j5jZkhwfXah8AeP/
         HdtHPntUJtKNh6Y4DbZb8dap37AUWtne/FTlUPSk2z1FA3UxbIIFBzzmtNqZAJwZgKVI
         jL9xE7GnomluKqcmvkRFv2Uh71mR56gMuJGvq9kBw9COY5aSdohd88oS02vAIIpo6514
         w8EuHGIhbY/Av5M3gpGdyI2g7kV0SGGn+i4YL6AeHdkZA5DZifca3vwiLx7YKeP0o0Pu
         SAvw==
X-Forwarded-Encrypted: i=1; AJvYcCXEoaOhjtX8kx6LPcfGUm0CFaxVDMKFC67ctkkETN0DXHfZpoWpV7Iqlk03wLhhgZj8R85aYyP6GqI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJIoa0ljrkNE4xxAH1vxdr+N1gZUi6FCS57X634OgrIsvYVqDS
	aNh4OJYTkCfgq4v7VCDhHIPxegdGZeCau1CzAQFhAVbVEDInohiMrvswORJGQVk=
X-Gm-Gg: ASbGnctoXcXSANoAKhCQ3T/2O/gM6rU3gaTxBDiWQF+WlopCj3i/ofIsroOuN3PTOGR
	L4htz2paYNZahwp21CPkYyrgPJps7jG8eMNhib22VEo+YfSlCCQ/GHmlx81/Eiz3tkS/dhQcFuk
	bqoHq3D8uH9CPXbqt/QWgZ0/2vajer5cyeErlydNKUTGXyelT81kQb1YmGfkK28xR8S+/x3+1qU
	n4iX/zM3332nJQjIkhsS+MGcSVB9wTCe93KVm5JyhCSC/YChagFEsP4bm8K76ZVtunYc7iHJoqQ
	rE0ah9+jH87q3L7tw70XKaWfnfRX
X-Google-Smtp-Source: AGHT+IFmp7b1yh0QEKdLgrjIIYD49wESbW2YfC1lavQg5SmkfBv2dPjIMLPytR1zKx8iqVccmwXu3w==
X-Received: by 2002:a17:90b:2b4d:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2f9e07673b6mr8850611a91.13.1738826610015;
        Wed, 05 Feb 2025 23:23:30 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:14 -0800
Subject: [PATCH v4 09/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232330_608498_45459730 
X-CRM114-Status: UNSURE (   9.64  )
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

U3NjY2ZnICjigJhTc+KAmSBmb3IgUHJpdmlsZWdlZCBhcmNoaXRlY3R1cmUgYW5kIFN1cGVydmlz
b3ItbGV2ZWwKZXh0ZW5zaW9uLCDigJhjY2Zn4oCZIGZvciBDb3VudGVyIENvbmZpZ3VyYXRpb24p
IHByb3ZpZGVzIGFjY2VzcyB0bwpkZWxlZ2F0ZWQgY291bnRlcnMgYW5kIG5ldyBzdXBlcnZpc29y
LWxldmVsIHN0YXRlLgoKVGhpcyBwYXRjaCBqdXN0IGVuYWJsZXMgdGhlIGRlZmluaXRpb25zIGFu
ZCBlbmFibGUgcGFyc2luZy4KClNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDIgKysKIGFy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IGI0ZWRkY2I1Nzg0Mi4uZmE1
ZTAxYmNiOTkwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0xMDMsNiArMTAzLDggQEAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NTUklORAkJOTQKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9T
TUNTUklORAkJOTUKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNOVFJQTUYgICAgICAgICA5Ngor
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1NTQ0NGRyAgICAgICAgICAgIDk3CisjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfU01DREVMRUcgICAgICAgICAgOTgKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hM
SU5VWEVOVkNGRwkxMjcKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDhmMjI1YzljMzA1NS4u
M2NiMjA4ZDQ5MTNlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0zOTAsMTIgKzM5MCwxNCBA
QCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlf
X1JJU0NWX0lTQV9FWFRfQlVORExFKHp2a3NnLCByaXNjdl96dmtzZ19idW5kbGVkX2V4dHMpLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a3QsIFJJU0NWX0lTQV9FWFRfWlZLVCksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAorCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHNtY2RlbGVnLCBSSVNDVl9JU0FfRVhUX1NNQ0RFTEVHKSwKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQShzbWNudHJwbWYsIFJJU0NWX0lTQV9FWFRfU01DTlRSUE1GKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShzbWNzcmluZCwgUklTQ1ZfSVNBX0VYVF9TTUNTUklORCksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoc21tcG0sIFJJU0NWX0lTQV9FWFRfU01NUE0pLAogCV9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVChzbW5wbSwgUklTQ1ZfSVNBX0VYVF9TTU5QTSwgcmlzY3ZfeGxpbnV4ZW52
Y2ZnX2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtc3RhdGVlbiwgUklTQ1ZfSVNBX0VY
VF9TTVNUQVRFRU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhU
X1NTQUlBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NjZmcsIFJJU0NWX0lTQV9FWFRfU1ND
Q0ZHKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NP
RlBNRiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njc3JpbmQsIFJJU0NWX0lTQV9FWFRfU1ND
U1JJTkQpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzc25wbSwgUklTQ1ZfSVNBX0VYVF9T
U05QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAoKLS0gCjIuNDMuMAoKCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
