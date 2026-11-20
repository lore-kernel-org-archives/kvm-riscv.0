Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE7606A33E
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dCoUWOn1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=FotCfS9b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+xkoi+UKcon5A0SXF5bLhl9hsDdkBw4r1uEXFXhV4jY=; b=dCoUWOn1P84zXasK1aA7e0+bnV
	xcXzYXOfCZpltKvS9sropUgiB0mgi6zjgicu7aRBMrtDve2qSP4EX3AwiAcx/8ZVKSg1DLgji8iG8
	nr06lrBxkAdCvvL7jMVxBIq8AuYJvBWrqDAONe03GYE16OwLSasN+CzVYB/wBmm8QgDt3+Cjzr1rJ
	Z5RzFyeGedwYD460KlM7O0NYtfADvj5oXNx65J9C1O0Hb2jC9dgPW2MVblv/t6FRUxF3cqdY+6Qmw
	lsh64b9ZQGaXL82oR7gQUvqlapED8vBneuQkausToEzbQX/AoRioHo5VBzAPt5jugJ8R+USS4DQI0
	ve0XaNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSMb-0000000FgSd-14ZA;
	Fri, 20 Nov 2026 17:25:29 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSMU-0000000FgMj-3DOd;
	Fri, 20 Nov 2026 17:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeuLbeG4/DVwLB1zDxdKur1APrwPUEOkQ4FSl5BPemc+2JKO0a7WeTzz7zFcKTZXcPmRKSwbyuGh03bbdhhEzEgTM/o3RtdhfCTo8l1gs8qoxbcjLNJobz1jKMwTnGK6jfjtLSHE6tGcDkZyrziSiLS3LR7gluA5AFKzAQE/YAXSv2tHgRrGajjaWtHJFvvTk3+suqyZPZslRwKtdnOVcksUGl1snKfqPMLiBM6KAfcg34MZlym9D9aVLqCkKFeksePhJrsxi7gUmxT//BdbF4y2nuqnCmfl8lAh25hRVf9RLsfil1FglFYlkVdd5L44hixfgD6CQdmzU+JzE3fktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JvcarMLiWryRrHUBFt4iOlI6gW3LQB+YbPwQJ+9S3M=;
 b=AU8Z1Bl9LZ3PUNa8FU2PtgwQtgpRM6XFUnBDj8B04q7j45tA2IgfEXaADuQVvN3bzd4qQyensAsUYKIljmwwgVA1g5L4v2jkmvMirCXoXN5Txf1a/YyfOfcafenUhHAP9Th9/FcAVlwCjuhwTuWYdHEVpXkGdW6haKHppVP0QYpsoN+lt0Zggaf33V15oWtm5z2FhH2HIazzLF6g0DoLNNmOsa5R0zo7twNojDiug97hR/bkcCqnEPXY8vldMIhNbt4o7unTqYr1ZNl4pfzOlcCQdzmeUyvFill3VHoHD0Klv+ihELR/7OF4hBMqWcdjrQ9OAzeL7A/wksQj+WKaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JvcarMLiWryRrHUBFt4iOlI6gW3LQB+YbPwQJ+9S3M=;
 b=FotCfS9bl/BSPLGadUim+VDTmcZyRZ75Bf1zI4HfKuju4zW0ek8sUo59gn0EMWs/2kAq9l749wun2prXJuxLMYGH6qYJy6h/4Bqeixks3HSA5PWhfIQkdiTKoHm14WUzdlcIZBXCksncgQ/WfllEA3kz/v92EQe/DabCI3LAHxA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by OS9P286MB7997.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:475::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 17:25:16 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 17:25:16 +0000
Date: Sat, 21 Nov 2026 02:25:15 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] RISC-V: KVM: Skip steal-time updates when run_delay
 is unchanged
Message-ID: <awCBn-a_i8k2hkbe@z790sl>
References: <20261118062242.2914385-1-den@valinux.co.jp>
 <20261118062242.2914385-3-den@valinux.co.jp>
 <awB4BxCHBu6nacbO@orel>
Content-Disposition: inline
In-Reply-To: <awB4BxCHBu6nacbO@orel>
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|OS9P286MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ec5c13-4fed-4aaf-9aae-08df472b3e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|7416014|1800799024|4143699003|10067099003|56012099006|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XRBPU8NoiIWjXJ1cSMU8jEghLh5vTXF1KDbmQbgZZXlbTIm00/c38GhjyiRzWmF+DzN3a6xS1/MRHrQl4xY/uRRHYk2zy2BiM7JsHamVENCIhWD3dzSd1q9J7Jattl8Oa55jl0Re/QHDEsTcn6NCtUL68UbZB9eKfIHxIhw6f8qQZitFAhxIOduNOG3snDOokEPLTqihFfqcaLOduoWStrCkbWpCQa3vGEbiDqd7zM84fIlJsLc4Q6Bq9oQi/qP6PygNO+4pQ6aeeRDybzVHtAdgOwtWhTCNNVMICqWEAM44REbFEDBlWhDNM5G7HAqVP3r8FNALNkmzdD2//PxdWzsN6iUjqllQI7faZJTKsQFOLKYtIH3R0t4/j+wDpNIkz2ftiBjvjzuuokxZiPpmNNjEQF951pI/xH4kgIMscOWvB714AIow3YtMwMgnHksQCfF1lKvgKNaNCoHijy1dz94/ibgAe6+sH9N7sDTvrZo7L+JI2YOPI/bU1JEfRoQlaH6Yz04dTRoZ7c7YsZPo45TL64WKx8Q/R9XoKiKSF2rU71saMAc53w7q8v2AXcuoYKDOk/fezGTpfGPKDl9sjYS8YtScFt/H2k9BuTNCq+7v6GCZCa/0lrAwW/Ot79kUABTHsY5+x1s0rnTV8w5eQOmKMQUN689bDpeuRJ5psHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(7416014)(1800799024)(4143699003)(10067099003)(56012099006)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VudRp4caP9n3JN0uAzkYSAKett4fnK9kFVWxuWGSOT1t8keUDEmndnuw+Vda?=
 =?us-ascii?Q?PdVsq5ohtOEy90V2QcP2/fwcXY221Fejy9loJMfXIe8pWRhXoSq8bdRyeICb?=
 =?us-ascii?Q?IPgv3aEYef428xh+pg3gPoLo3LsXXZd0H5K4Y//4AifuZVCISsAOnnXdHysV?=
 =?us-ascii?Q?D3nO/LdtYxvcbnxxSnx5yAZ7Dr39x+LfyQktTm6c6itYFLPpDqn3oko4nBYV?=
 =?us-ascii?Q?/mPZHL68Wj0Y3z7cTX0+I6AHZB15w8I6uqCXWKHsh2R4bCq+89FJ1ucCRtLz?=
 =?us-ascii?Q?+RqOLyFRXQcCejzxPunUmzaBfKtWlmxh8DML4QnutQ1VzY+JMO0ci+TA2r3O?=
 =?us-ascii?Q?b+BQoXlc/EME54IMaPin5NBxXXTC5+fiAAryLEjc02iy84PY4JBui+I2IgUX?=
 =?us-ascii?Q?V0pGmt4YVf/fW8yxzUgJNdIj1CD+2qCrwN2yVCcjuHVCHRWKHbiU/AxqyFpc?=
 =?us-ascii?Q?2vtT+wG/GccnLR2SZHjD54yqhVydBuk1jrK/qcQIV0pLro1swiF6z+dazH3p?=
 =?us-ascii?Q?/XfEmY+IE5KhdLP1IRgzh29+e4VSHgwHA6TY2I6MDW3WrgY7pPl49tJKSvEH?=
 =?us-ascii?Q?4lixm0jcnjhVC1qQ2yZH+BKjrw5CozNXz3uCKIfuI9iehrelC9pLuxBA5pQF?=
 =?us-ascii?Q?as1PJ97G6KD0+TQE0SnIVKJsWRR1jcrW1S7a+IB/zVDMX4CILIbwCHceJFQa?=
 =?us-ascii?Q?d1FpNdNZoPL1D4zdLL7X/qFfKotEdOTw5hsJah0yYw/xMhg8fwikh41OujPm?=
 =?us-ascii?Q?PG3RrwC3VBCw1tUcmTly9i7ShXnWUv95VXzXvuJ6t/AJUeP0Kk8X5xN7C9Hy?=
 =?us-ascii?Q?Uq+QpsiRy4Ordfcmv6vCibYeeBw4ISDa/dfrJkipoVyVq5YCVwF0Utid53vN?=
 =?us-ascii?Q?6+rkzBRaHFmDCriX+BGaLBSvKDr0wBKW1RjokarFgdd1KzETrmThU6OQjRjC?=
 =?us-ascii?Q?qheVORBNsGrboz/ptMUGk1EE1SVfV7uBYgdnTOBfbnNv+iIIGzl9m6hhStFQ?=
 =?us-ascii?Q?4zSo4vFQFVdwrqUiV2reumaEmlNxghh7Au32Ic1yIa4XjUeCwwMDy/+E7Yp3?=
 =?us-ascii?Q?G6UCC/CmySVBuiu5eomwWXLl9ImqxGGDatFQ9DOKtNREE8V96md9S/47xmwN?=
 =?us-ascii?Q?BXvG//F1gKmadV6EhfBzI9cKu8tq6d61BfALuuNLY8OqLqezoJYLJS9othWE?=
 =?us-ascii?Q?IF3hZ9PLLwjoEf6KbuoN7gBznZfOQbF9+ZEXEb160bEoQJHX3aWLgyi33rv8?=
 =?us-ascii?Q?4URcndDswPJMf+9F0lodROt4n1k1Pw+7E5VV7lcB5HklZRAxtFnnHFDo8NcL?=
 =?us-ascii?Q?75A9ADWM/p1ijDELmTUf9OID5ZeSe80TYrzVdfigEa8RNykagqvIRYrTlMVk?=
 =?us-ascii?Q?FF9ebqP9M8q4+HvUSSntPmZ5Z6kJBq/R2Wd2Cdwgf+dpmmfwKd8Ia0lYu0xE?=
 =?us-ascii?Q?ZBecuwKx+WC2Zj0+B0ixBTDWOJ95/wB9/2KIh7TEqKJjccg54iJ2xKtVWkPX?=
 =?us-ascii?Q?RXivgH1Idh31SUxuSQB/zPH1cSMkquc4K9wQ+cmMFWCMYCYIb5MSsoz5/pif?=
 =?us-ascii?Q?iiV0gxPpneVmfaeHv8V+tqs4e+I7yb4JGCgw3y7+PZ5TofKnTxcr3I6IEhFk?=
 =?us-ascii?Q?YUvwZe1vE8DOWfdV3lwPhM3fMDKzhTXtk0c0qOoGBWZz2Np/GfilpF+SdZWs?=
 =?us-ascii?Q?+OTAbXTtlFGEWT3UxzdanG2x7WFyFT6NqKIUUdRYhRbigA24+Wn3byLeDbb0?=
 =?us-ascii?Q?tA8LD/22EQkYTrGvHem8iH3sW3tgk4J+n8sNtJ9aN5vdmwtmrh6Q?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ec5c13-4fed-4aaf-9aae-08df472b3e53
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:25:16.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itFApcfnog+2CuVWkDAL4LDGePN1obPtqizGkCjmNF6S/4z5FuzVSlLnI2CD2Pgjpnw0ch8KkFVFr7apGV5usA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_092522_822085_63341907 
X-CRM114-Status: GOOD (  18.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 05:45:09PM +0100, Andrew Jones wrote:
> On Wed, Nov 18, 2026 at 03:22:42PM +0900, Koichiro Den wrote:
> > Check run_delay against last_steal and skip the update if they match.
> > This avoids accessing the SBI STA shared structure and marking its page
> > dirty on vCPU loads with no new steal time to report.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  arch/riscv/kvm/vcpu_sbi_sta.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> > index cfc6f22c3e33..8b2499876fb4 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> > @@ -31,7 +31,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
> >  	__le32 sequence_le;
> >  	__le64 steal_le;
> >  	u32 sequence;
> > -	u64 steal;
> > +	u64 steal, run_delay;
> >  	unsigned long hva;
> >  	bool dirty = false, success = false;
> >  	gfn_t gfn;
> > @@ -52,6 +52,10 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
> >  		return;
> >  	}
> >  
> > +	run_delay = READ_ONCE(current->sched_info.run_delay);
> > +	if (run_delay == last_steal)
> > +		return;
> > +
> 
> If we move the new check to just below the 'if (shmem == INVALID_GPA)'
> check then we also avoid a memslot lookup.

Indeed. Thanks for pointing that out! Will move the check in v2.

Best regards,
Koichiro Den

> 
> >  	st = (struct sbi_sta_struct __user *)(hva + offset_in_page(shmem));
> >  	might_fault();
> >  	if (WARN_ON(!user_access_begin(st, sizeof(*st))))
> > @@ -66,7 +70,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
> >  	smp_wmb();
> >  	unsafe_get_user(steal_le, &st->steal, update_sequence);
> >  	steal = le64_to_cpu(steal_le);
> > -	vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
> > +	vcpu->arch.sta.last_steal = run_delay;
> >  	steal += vcpu->arch.sta.last_steal - last_steal;
> >  	unsafe_put_user(cpu_to_le64(steal), &st->steal, update_sequence);
> >  	success = true;
> > -- 
> > 2.54.0
> >
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
